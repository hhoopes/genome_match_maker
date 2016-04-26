require 'rails_helper'

RSpec.describe StudyParticipation, type: :model do
  it { should belong_to :user }
  it { should belong_to :study }

  it "creates a participation from an array of studies" do
    study_array = []
    study_array << create(:study)
    study_array << create(:study)
    participant = create(:participant)

    StudyParticipation.add_participation(study_array, participant)
    first_participation = StudyParticipation.first
    second_participation = StudyParticipation.last

    expect(first_participation.study).to eq(Study.first)
    expect(second_participation.study).to eq(Study.last)
    expect(StudyParticipation.where(user_id: participant.id).count).to eq(2)
    expect(first_participation.user_id).to eq(second_participation.user_id)
  end
end
