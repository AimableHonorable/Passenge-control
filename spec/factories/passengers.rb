FactoryBot.define do
  factory :passenger do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    phone { 1 }
    id_number { 1 }
    destination { "MyString" }
    ref_first_name { "MyString" }
    ref_last_name { "MyString" }
    ref_phone_number { "MyString" }
    entry_on { "2019-11-25" }
    return_on { "2019-11-25" }
  end
end
