class User < ApplicationRecord
  has_one :profile
  has_many :requisition
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      # Im not pretty shure if this should be here as a good practices....
      # I think it should use it the Graph API of facebook to use the fb data in out of the authentication, but this is like an example i founded
      profile = Profile.create(
        user_id:         user.id,
        first_name:      auth.info.first_name,
        first_last_name: auth.info.last_name,
        birth_date:      Date.strptime(auth.extra.raw_info.birthday,'%m/%d/%Y')
      )
      profile.save
    end

    user
    
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private

end
