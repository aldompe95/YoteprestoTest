require 'rails_helper'

RSpec.describe ProfileController do
  
  login_user
  let(:profile){FactoryGirl.create(:profile)}

  describe "GET new" do
    it "assigns @profile" do
      get :new
      expect(assigns(:profile)).to be_a_new(Profile)
      expect(response.status).to be(200)
    end
  end

  describe "POST create" do
    it "creates a valid @profile" do
      post :create, params: profile_params
      expect(Profile.last).to be_valid
      expect(response.status).to be(302)
    end

    it "returns a invalid @profile" do
      post :create, params: { profile: {user_id: ""} }
      expect(Profile.count).to be(0)
      expect(response.status).to be(302)
    end
  end

  describe "PUT update" do
    it "updates a @profile with valid data" do
      put :update, params: { id: profile.id, profile: { first_name: "Pedro" } }
      expect(Profile.last.first_name).to eql("Pedro")
      expect(response.status).to be(302)
    end

    it "updates a @profile with invalid data" do
      put :update, params: { id: profile.id, profile: { first_name: "123" } }
      expect(Profile.last.first_name).to eql("Aldo")
      expect(response.status).to be(302)
    end
  end


  def profile_params
    { profile: 
      {
        user_id:           "1",
        first_name:        "Aldo",
        second_name:       "Pedro",
        first_last_name:   "Marquez",
        second_last_name:  "Padilla",
        birth_date:        "09/13/2017",
        curp:              "MAEA950426HCMRSL00",
        rfc:               "MAEA950426KN1",
        gender:            "Male",
        birth_state:       "AL",
        phone_number:      "3121414298"
      }
    }
  end

end
