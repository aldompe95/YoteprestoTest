require 'rails_helper'

RSpec.describe Requisition, type: :model do
  
  let(:requisition){FactoryGirl.create(:requisition)}

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:income) }
  it { is_expected.to validate_presence_of(:address_years) }
  it { is_expected.to validate_presence_of(:company_years) }
  it { is_expected.to validate_presence_of(:marital_status) }
  it { is_expected.to validate_presence_of(:requested_amount) }
  it { is_expected.to validate_presence_of(:payment_terms) }
  it { is_expected.to validate_presence_of(:bank) }
  it { is_expected.to validate_presence_of(:comment) }
  it { is_expected.to validate_presence_of(:company_name) }
  it { is_expected.to validate_presence_of(:company_phone_number) }
  it { is_expected.to validate_presence_of(:dependents_number) }
  it { is_expected.to validate_presence_of(:company_position) }
  it { is_expected.to validate_presence_of(:first_reference) }
  it { is_expected.to validate_presence_of(:second_reference) }
  it { is_expected.to validate_presence_of(:third_reference) }

  
  context 'validations' do
    it "has a valid data" do
      expect(requisition).to be_valid
    end

    it "has a invalid data" do
      requisition.income = ""
      expect(requisition).to be_invalid
    end

  end
end
