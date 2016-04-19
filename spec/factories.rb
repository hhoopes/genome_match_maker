FactoryGirl.define do
  factory :researcher do
    contact_name "MyString"
    organization "MyString"
    email "MyString"
    description "MyString"
  end
  factory :user do
    email "MyString"
    uid "MyString"
    access_token "MyString"
    refresh_token "MyString"
    first_name "MyString"
    last_name "MyString"
  end
end