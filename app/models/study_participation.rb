class StudyParticipation < ActiveRecord::Base
  belongs_to :study
  belongs_to :user

  def self.add_participation(study_array, participant)
    study_array.each do | study|
      StudyParticipation.where(study_id: study.id, user_id: participant.id).first_or_create
    end
  end
end
