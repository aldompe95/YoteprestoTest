class Requisition < ApplicationRecord
  validates_presence_of :user_id, :income, :address_years, :company_years, :marital_status,
    :requested_amount, :payment_terms, :bank, :comment, :company_name, :company_phone_number , :dependents_number, :company_position,
    :first_reference, :second_reference, :third_reference

  validates :bank, :comment, :company_name, :company_position, 
    :first_reference, :second_reference, :third_reference, format: { with: /\A[a-zA-Z]*(?: [a-zA-Z]*)?\z/,
    message: "only letters are allowed and cant have only spaces" }

  validates :has_sgmm, :has_imss, :has_car, inclusion: { in: [ true, false ], :message => 'must select at least one'}

  validates :payment_terms, inclusion: { in: [ true ], :message => 'need to be accepted'}

  validates :company_phone_number, :numericality => true,
    :length => { :minimum => 10, :maximum => 10, :message => 'must have 10 numerical digits'}  

  validates :income, :requested_amount, numericality: { greater_than: 0 }
  validates :address_years, :marital_status, :dependents_number, numericality: { only_integer: true, greater_than: 0 }
end