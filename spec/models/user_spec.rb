require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of (:email) }
  it { should have_secure_password }
  it { should have_many :studies }

  describe "find_or_create_with_auth" do
    it "creates a new user from user_info hash" do
      user_info = { first_name: "Sally",
                    last_name:  "Golightly",
                    email:      "sally@example.com"
      }
      expect(User.count).to eq(0)
      User.find_or_create_from_auth(user_info)

      expect(User.count).to eq(1)
      expect(User.first.first_name).to eq(user_info[:first_name])
      expect(User.first.last_name).to eq(user_info[:last_name])
      expect(User.first.email).to eq(user_info[:email])
    end
  end
end
