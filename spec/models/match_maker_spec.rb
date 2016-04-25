require 'rails_helper'

RSpec.describe MatchMaker, type: :model do
  describe ".generate_snps" do
    it "returns Snp objects for a given user to match existing studies" do
      VCR.use_cassette("location lookup") do
        user = create(:participant)
        study = create(:study)
        study.snps << generated_snp("rs3094315", "AA", "study")
        study.snps << generated_snp("rs41383248", "__", "study")

        expect(Snp.count).to eq(2)
        expect(Location.count).to eq(2)

        MatchMaker.generate_snps(user)

        expect(Snp.count).to eq(4)
        expect(Location.count).to eq(2)
        expect(user.snps.count).to eq(2)

        user.snps.zip(study.snps).each do | user_snp, study_snp |
          expect(user_snp.location.position).to eq(study_snp.location.position)
        end
      end  
    end
  end
end
