class CreateRequisitions < ActiveRecord::Migration[5.1]
  def change
    create_table :requisitions do |t|
      t.belongs_to :user, index: true
      t.decimal :income
      t.integer :address_years
      t.string :company_years
      t.integer :marital_status
      t.decimal :requested_amount
      t.boolean :payment_terms
      t.string :bank
      t.string :comment
      t.string :company_name
      t.string :company_phone_number
      t.integer :dependents_number
      t.string :company_position
      t.boolean :has_sgmm 
      t.boolean :has_imss
      t.boolean :has_car 
      t.string :first_reference
      t.string :second_reference
      t.string :third_reference
      t.timestamps
    end
  end
end
