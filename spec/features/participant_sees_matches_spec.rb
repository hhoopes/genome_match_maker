require 'rails_helper'

feature "Participant sees matches" do
  scenario "when they check their dashboard" do
    participant = create(:participant)

    researcher = create(:researcher)
    researcher.studies << create(:study)
    matching_study = Study.last
    matching_study.snps << generated_snp("rs3094315", "AA", "study")

    researcher2 = create(:researcher)
    researcher2.studies << create(:study)
    nonmatching_study = Study.last
    nonmatching_study.snps << generated_snp("rs23364", "CC", "study")

    log_in(participant)
    visit dashboard_path

    expect(page).to have_content("Your Research Studies")
    expect(page).to have_content(researcher.researcher_credential.organization)
    expect(page).to have_link(matching_study.name, study_path(matching_study))
    expect(page).not_to have_link(nonmatching_study.name, study_path(nonmatching_study))
  end
end
