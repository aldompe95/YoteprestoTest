require 'rails_helper'

RSpec.describe RequisitionsController do
  
  login_user
  let(:profile){FactoryGirl.create(:profile)}
  let(:requisition){FactoryGirl.create(:requisition)}
  
  describe "GET new" do
    it "assigns @requisition" do
      profile
      get :new
      expect(assigns(:requisition)).to be_a_new(Requisition)
      expect(response.status).to be(200)
    end
  end

  describe "POST create" do
    it "creates a valid @requisition" do
      post :create, params: requisition_params
      expect(Requisition.count).to be(1)
      expect(response.status).to be(302)
    end

    it "returns a invalid @requisition" do
      post :create, params: { requisition: {user_id: ""} }
      expect(Requisition.count).to be(0)
      expect(response.status).to be(302)
    end
  end

  describe "PUT update" do
    it "updates a @requisition with valid data" do
      put :update, params: { id: requisition.id, requisition: { income: 30000 } }
      expect(Requisition.last.income).to eql(30000)
      expect(response.status).to be(302)
    end

    it "updates a @profile with invalid data" do
      put :update, params: { id: requisition.id, requisition: { income: "abc" } }
      expect(Requisition.last.income).to eql(25000)
      expect(response.status).to be(302)
    end
  end


  def requisition_params
    { requisition: 
      {
        user_id:               "1",
        income:                25000 ,
        address_years:         1,
        company_years:         1,
        marital_status:        1,
        requested_amount:      30000,
        payment_terms:         true,
        bank:                  "HSBC",
        comment:               "Testing",
        company_name:          "Mi company",
        company_phone_number:  "3121414298",
        dependents_number:     1,
        company_position:      "Developer",
        has_sgmm:              true,
        has_imss:              true,
        has_car:               true,
        first_reference:       "Aldo",
        second_reference:      "Maria",
        third_reference:       "Luz"
      }
    }
  end

end