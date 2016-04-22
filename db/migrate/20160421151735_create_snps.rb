class CreateSnps < ActiveRecord::Migration
  def change
    create_table :snps do |t|
      t.string :snppable_type
      t.integer :snppable_id

      t.timestamps null: false
    end
    add_index :snps, :snppable_id
  end
end
