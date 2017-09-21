require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:first_last_name) }
    it { is_expected.to validate_presence_of(:second_last_name) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:curp) }
    it { is_expected.to validate_presence_of(:rfc) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:birth_state) }
    it { is_expected.to validate_presence_of(:phone_number) }

    it "has a valid factory" do
      profile = FactoryGirl.build(:profile)
      expect(profile).to be_valid
    end
  end
end
