class CreateStudyParticipations < ActiveRecord::Migration
  def change
    create_table :study_participations do |t|
      t.references :study, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
