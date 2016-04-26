require "rails_helper"

feature "visitor views study show page" do
  scenario "they see a study's information"  do
    user = create(:researcher)
    user.studies << create(:study)
    study = Study.last
    study.snps << generated_snp("rs103", "AA", "study")
    visit study_path(study)

    expect(page).to have_content(study.name)
    expect(page).to have_content(study.description)
    expect(page).to have_content(study.user.researcher_credential.organization)
    expect(page).to have_content(study.snp_values.first.base_pair)
  end
end
