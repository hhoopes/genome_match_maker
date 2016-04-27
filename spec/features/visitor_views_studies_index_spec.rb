require 'rails_helper'

feature 'visitor views studies index' do
  scenario "and sees all the studies but not personal information" do
    10.times do
      user = create(:researcher)
      user.studies << create(:study)
      Study.last.snps << generated_snp(create(:location).position, "AA", "study")
    end
    participant = create(:participant)
    StudyParticipation.create(user_id: participant.id, study_id: Study.first.id)

    visit "/studies"

    expect(page).to have_selector('div.studies', count: 10)

    Study.all.each do | study |
      within(".study-#{study.id}") do
        expect(page).to have_content(study.name)
        expect(page).to have_content(study.user.researcher_credential.organization)
      end
    end

    StudyParticipation.all.each do |participation|
      expect(page).not_to have_content(participation.user.first_name)
      expect(page).not_to have_content(participation.user.last_name)
    end
  end
end
