FactoryGirl.define do
  factory :profile do
    user_id           "1"
    first_name        "Aldo"
    second_name       "Pedro"
    first_last_name   "Marquez"
    second_last_name  "Padilla"
    birth_date        "09/13/2017"
    curp              "MAEA950426HCMRSL00"
    rfc               "MAEA950426KN1"
    gender            "Male"
    birth_state       "AL"
    phone_number      "3121414298"
  end
end
