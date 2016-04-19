class CreateResearchers < ActiveRecord::Migration
  def change
    create_table :researchers do |t|
      t.string :contact_name
      t.string :organization
      t.string :email
      t.string :description

      t.timestamps null: false
    end
  end
end
