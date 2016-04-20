require 'rails_helper'

RSpec.describe ParticipantCredential, type: :model do
  it { should belong_to (:user) }
  it {should validate_uniqueness_of (:uid)}

  describe "find_or_create_with_auth" do
    it "creates a new participant_credentials from token_hash and user_info" do
      user_info = { uid: "a326bal320"
      }
      token_hash = {  access_token: "sample_access_token",
                      refresh_token: "sample_refresh_token",
      }

      expect(ParticipantCredential.count).to eq(0)
      ParticipantCredential.find_or_create_from_auth(token_hash, user_info)
      expect(ParticipantCredential.count).to eq(1)
      expect(ParticipantCredential.first.uid).to eq(user_info[:uid])
      expect(ParticipantCredential.first.access_token).to eq(token_hash[:access_token])
      expect(ParticipantCredential.first.refresh_token).to eq(token_hash[:refresh_token])
    end
  end
end
