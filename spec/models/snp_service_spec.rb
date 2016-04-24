require 'rails_helper'

RSpec.describe SnpService do
  describe "it calls the api for a given location" do
    it "receives base pair information" do
      VCR.use_cassette("snp service") do
        user = create(:participant)
        user.participant_credential.uid = "b9e65773cfcdadfd"
        token = valid_token
        service = SnpService.new(token, user)

        base_pair = service.find_basepairs("rs3094315")
        expect(base_pair).to eq("AA")

        nonexistent_pair = service.find_basepairs("garbage")
        expect(nonexistent_pair).to be_nil
      end
    end
  end
end
