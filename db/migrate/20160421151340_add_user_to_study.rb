class AddUserToStudy < ActiveRecord::Migration
  def change
    add_reference :studies, :user, index: true, foreign_key: true
  end
end
