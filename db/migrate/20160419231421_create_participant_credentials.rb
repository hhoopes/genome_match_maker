class CreateParticipantCredentials < ActiveRecord::Migration
  def change
    create_table :participant_credentials do |t|
      t.string :access_token
      t.string :refresh_token
      t.string :uid

      t.timestamps null: false
    end
  end
end
