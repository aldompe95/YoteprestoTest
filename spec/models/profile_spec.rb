require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'validations' do

    it "has a valid factory" do
      profile = FactoryGirl.build(:profile)
      expect(profile).to be_valid
    end
    
  end
end
