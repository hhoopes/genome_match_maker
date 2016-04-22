FactoryGirl.define do
  factory :snp_value do
    base_pair "MyString"
    location "MyString"
    snp nil
  end
  factory :snp do
    snp_type "MyString"
    snppable_id "MyString"
  end
  factory :study do
    name "MyString"
    description "MyString"
  end
  factory :researcher, class: ResearcherCredential do
    description "MyString"
    organization "MyOrganization"
    user
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
