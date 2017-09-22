FactoryGirl.define do
  factory :requisition do
    user_id               "1"
    income                25000 
    address_years         1
    company_years         1
    marital_status        1
    requested_amount      30000
    payment_terms         true
    bank                  "HSBC"
    comment               "Testing"
    company_name          "Mi company"
    company_phone_number  "3121414298"
    dependents_number     1
    company_position      "Developer"
    has_sgmm              true
    has_imss              true
    has_car               true
    first_reference       "Aldo"
    second_reference      "Maria"
    third_reference       "Luz"
  end
end 
