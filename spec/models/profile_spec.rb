require 'rails_helper'

RSpec.describe Profile, type: :model do
  
  let(:profile){FactoryGirl.create(:profile)}
  
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

    it "has a valid data" do
      expect(profile).to be_valid
    end

    it "has a invalid data" do
      profile.curp = nil
      expect(profile).to be_invalid
    end

  end
end
