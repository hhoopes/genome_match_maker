class AddUserToResearcherCredential < ActiveRecord::Migration
  def change
    add_reference :researcher_credentials, :user, index: true, foreign_key: true
  end
end
