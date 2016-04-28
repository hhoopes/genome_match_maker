require 'rails_helper'

feature "researcher visits their dashboard" do
  scenario "and sees participants matching their studies" do
    VCR.use_cassette("researcher matches")  do
      matching_participant = create(:participant)

      researcher = create(:researcher)
      researcher.studies << create(:study)
      matching_study = Study.last
      matching_study.snps << generated_snp("rs3094315", "AA", "study")

      researcher.studies << create(:study)
      nonmatching_study = Study.last
      nonmatching_study.snps << generated_snp("rs23364", "CC", "study")
      log_in(researcher)
      visit dashboard_path

      within("div.study-#{matching_study.id}") do
        expect(page).to have_content(matching_study.name)
        expect(page).to have_content("1 matching participant")
        expect(page).to have_content("rs3094315")
        expect(page).to have_content("AA")
        expect(page).to have_link(matching_study.name, study_path(matching_study))
      end

      within("div.study-#{nonmatching_study.id}") do
        expect(page).to have_content(nonmatching_study.name)
        expect(page).to have_content("rs23364")
        expect(page).to have_content("CC")
        expect(page).to have_content("This study has no matching participants")
        expect(page).to have_link(nonmatching_study.name, study_path(nonmatching_study))
      end
    end
  end
end
