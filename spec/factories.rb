FactoryGirl.define do
  factory :researcher_credential do
    description "MyString"
  end
  factory :participant_credential do
    access_token "MyString"
    refresh_token "MyString"
    uid "MyString"
  end
  factory :user do
    first_name "MyString"
    last_name "MyString"
    password "MyString"
    email "MyString"
  end
end
