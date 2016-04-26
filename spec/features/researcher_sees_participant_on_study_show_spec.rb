require "rails_helper"

feature "researcher views study show page" do
  scenario "they see participant ids"  do
    user = create(:researcher)
    user.studies << create(:study)
    study = Study.last
    study.snps << generated_snp("rs103", "AA", "study")
    participant = create(:participant)
    study.study_participations <<
      StudyParticipation.create(user_id: participant.id)
    visit study_path(study)

    expect(page).to have_content(study.name)
    expect(page).to have_content(study.description)
    expect(page).not_to have_content("Participants")
    expect(page).not_to have_content("#{participant.id}")

    log_in(user)
    visit study_path(study)

    expect(page).to have_content("Participants")
    expect(page).to have_content("#{participant.id}")
  end
end
