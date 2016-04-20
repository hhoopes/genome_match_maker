class CreateResearcherCredentials < ActiveRecord::Migration
  def change
    create_table :researcher_credentials do |t|
      t.string :description
      t.string :organization

      t.timestamps null: false
    end
  end
end
