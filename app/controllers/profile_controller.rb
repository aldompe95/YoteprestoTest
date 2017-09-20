class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, :are_requisitions?,  only: [:edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path, :flash => { :success => "Profile created successfully" }
    else
      flash[:danger] = @profile.errors.to_a
      redirect_to new_profile_path
    end
  end

  def edit
  end

  def update

    if @profile.update(profile_params)
      redirect_to root_path, :flash => { :success => "Profile updated successfully" }
    else
      flash[:danger] = @profile.errors.to_a
      redirect_to edit_profile_path
    end
    
  end

  private
  
  def profile_params
    params.require(:profile).permit(:user_id, :first_name, :second_name, :first_last_name, 
      :second_last_name, :birth_date, :curp, :rfc, :gender, :birth_state, :phone_number)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def are_requisitions?
    @requisition = current_user.requisition.exists?
    if @requisition
      flash[:notice] = 'You cant modify your profile because you already have requisitions'
      redirect_to root_path
    end
  end
end
