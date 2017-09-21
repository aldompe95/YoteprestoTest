class RequisitionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_requisition, only: [:edit, :update]
  #before_action :is_profile_complete?, only: [:new, :create]

  def new
    @requisition = Requisition.new
  end

  def create
    @requisition = Requisition.new(requisition_params)
    if @requisition.save
      redirect_to root_path, :flash => { :success => "Requisition created successfully" }
    else
      flash[:danger] = @requisition.errors.to_a
      redirect_to new_requisition_path
    end
  end

  def edit
  end

  def update
    if @requisition.update(requisition_params)
      redirect_to root_path, :flash => { :success => "Requisition updated successfully" }
    else
      flash[:danger] = @requisition.errors.to_a
      redirect_to edit_requisition_path
    end
  end

  private

  def requisition_params
    params.require(:requisition).permit(:user_id, :income, :address_years, :company_years, :marital_status,
      :requested_amount, :payment_terms, :bank, :comment, :company_name, :company_phone_number , :dependents_number, :company_position, :has_sgmm,
      :has_imss, :has_car , :first_reference, :second_reference, :third_reference)
  end

  def set_requisition
    @requisition = Requisition.find(params[:id])
  end

  def is_profile_complete?
    @profile = current_user.profile
    if @profile
      flash[:notice] = "Please fill your profile to create a requisition"
      redirect_to root_path
    end 
    @profile.attributes.each_pair do |name, value|
      if value == (nil || "")
        flash[:notice] = "Please fill your profile to create a requisition"
        redirect_to root_path
      end
    end 
  end
end

