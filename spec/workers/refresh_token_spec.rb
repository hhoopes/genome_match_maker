require 'rails_helper'

RSpec.describe TokenRefresher do
  describe "exchanges refresh_token for new access token" do
    it "gets tokens back" do
      VCR.use_cassette("token refresh") do
        participant = create(:participant)
        expect(User.count).to eq(1)

        old_access_token = participant.participant_credential.access_token
        old_refresh_token = participant.participant_credential.refresh_token

        TokenRefresher.new.perform

        new_access_token = participant.reload.participant_credential.access_token
        new_refresh_token = participant.reload.participant_credential.refresh_token

        expect(old_access_token).not_to eq(new_access_token)
        expect(old_refresh_token).not_to eq(new_refresh_token)
      end
    end
  end
end
