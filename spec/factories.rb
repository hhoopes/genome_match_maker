FactoryGirl.define do
  factory :study_participation do
    study nil
  end
  factory :location do
    position "MyString"
  end
  factory :snp_value do
    base_pair "MyString"
  end
  factory :snp do
    snppable_type "user"
    snppable_id "MyString"
  end
  factory :study do
    sequence(:name) { | n| "Mitosis in Squirrels and Humans #{n}" }
    description "MyString"
  end
  factory :researcher, class: User do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name + ", PhD" }
    password "MyString"
    email { Faker::Internet.safe_email }
    researcher_credential
  end
  factory :researcher_credential do
    description "this stuff"
    organization { Faker::University.name }
  end
  factory :participant, class: User do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name  }
    password "MyString"
    email { "Participant" + Faker::Internet.safe_email }
    participant_credential
  end
  factory :participant_credential do
    access_token ENV["ACCESS_TOKEN"]
    refresh_token "MyString"
    uid "b9e65773cfcdadfd"
  end
  factory :user do
    first_name "MyString"
    last_name "MyString"
    password "MyString"
    email "MyString"
  end
end
