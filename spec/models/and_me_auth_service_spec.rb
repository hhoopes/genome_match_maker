require 'rails_helper'

RSpec.describe AndMeAuthService do
  describe "api call token endpoint with access code" do
    it "gets tokens back" do

      VCR.use_cassette("auth service and token") do
        code = "552ba8a755ed4878afcd567230b0141b"
        response = AndMeAuthService.get_token(code)

        expect(response[:refresh_token]).not_to be_nil
        expect(response[:access_token]).not_to be_nil
      end
    end

    it "gets user info" do
      VCR.use_cassette("user info") do
        response = AndMeAuthService.get_user_info(valid_token)
        expect(response.keys).to eq([:uid, :email, :first_name, :last_name])
        response.values.each do | value |
          expect(value).not_to be_nil
        end
      end
    end
  end
end
