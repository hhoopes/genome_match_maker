require 'rails_helper'

RSpec.describe UserService do
  describe "service calls api for user info" do
    it "receives information back" do
      VCR.use_cassette("user service") do
        token       = valid_token
        service     = UserService.new(token)

        uid         = service.uid
        email       = service.email
        first_name  = service.first_name
        last_name   = service.last_name

        expect(uid).to eq("b9e65773cfcdadfd")
        expect(first_name).to eq("Heidi")
        expect(last_name).to eq("Hoopes")
        expect(email).to eq("heidih@gmail.com")
      end
    end
  end
end
