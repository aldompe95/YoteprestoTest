class Profile < ApplicationRecord
  validates_presence_of :user_id, :first_name, :first_last_name, 
    :second_last_name, :birth_date, :curp, :rfc, :gender, :birth_state, :phone_number
  
  validates :first_name, :second_name, :first_last_name, :second_last_name,
    :birth_state, :gender, format: { with: /\A[a-zA-Z]*(?: [a-zA-Z]*)?\z/,
    message: "only letters are allowed" }

  validates_format_of :birth_date, :with => /\d{2}\/\d{2}\/\d{4}/, 
    :message => "must be in the following format: mm/dd/yyyy"

  validates_format_of :curp, :with => /\A[A-Z][AEIOUX][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][MH][A-Z][BCDFGHJKLMNÑPQRSTVWXYZ]{4}[0-9A-Z][0-9]\z/i, 
    :message => "must have a valid format"

  validates_format_of :rfc, :with => /\A[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9]([A-Z0-9]{3})?\z/i, 
    :message => "must have a valid format"

  validates :gender, :inclusion => { :in => %w(Male Female),
  :message => "%{value} is not a valid gender" }

  validates :phone_number, :numericality => true,
    :length => { :minimum => 10, :maximum => 10, :message => 'must have 10 numerical digits'}
end
