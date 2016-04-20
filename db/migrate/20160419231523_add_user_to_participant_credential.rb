class AddUserToParticipantCredential < ActiveRecord::Migration
  def change
    add_reference :participant_credentials, :user, index: true, foreign_key: true
  end
end
