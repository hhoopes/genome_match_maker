require 'rails_helper'

feature "Participant sees matches" do
  scenario "when they check their dashboard" do
    VCR.use_cassette("participant matches")  do
      participant = create(:participant)

      researcher = create(:researcher)
      researcher.studies << create(:study)
      matching_study = Study.last
      matching_study.snps << generated_snp("rs3094315", "AA", "study")

      researcher.studies << create(:study)
      nonmatching_study = Study.last
      nonmatching_study.snps << generated_snp("rs23364", "CC", "study")

      log_in(participant)
      visit dashboard_path

      expect(page).to have_content("Your Genome Matches")

      within("div.study-#{matching_study.id}") do
        expect(page).to have_content(matching_study.name)
        expect(page).to have_link(matching_study.name, study_path(matching_study))
        expect(page).to have_content("rs3094315")
        expect(page).to have_content("AA")
      end

      expect(page).not_to have_content(nonmatching_study.name)
      expect(page).not_to have_link(nonmatching_study.name, study_path(nonmatching_study))
    end
  end
end
