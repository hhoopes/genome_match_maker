require 'rails_helper'

RSpec.describe AndMeAuthService do
  describe "api call token endpoint with access code" do
    it "gets tokens back" do

      VCR.use_cassette("auth service and token") do
        code = "48deb47b3a030ab6e63e2e946b64a73f"
        response = AndMeAuthService.get_token(code)

        expect(response[:refresh_token]).not_to be_nil
        expect(response[:access_token]).not_to be_nil
      end
    end
  end
end
