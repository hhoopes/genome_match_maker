class AddUserToStudyParticipation < ActiveRecord::Migration
  def change
    add_reference :study_participations, :user, index: true, foreign_key: true
  end
end
