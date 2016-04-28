require 'rails_helper'

RSpec.describe UserCreator do
  describe "it authorizes a 23 user" do
    it "and returns a GMM user" do
      VCR.use_cassette("user creator") do
        code = "78ac436116e0674a4e83d1ae8cc45e87"
        user = UserCreator.create_user(code)

        expect(user).to be_a_kind_of User
        expect(user.participant_credential).to be_a_kind_of ParticipantCredential
      end
    end
  end
end
