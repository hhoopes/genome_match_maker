class CreateSnpValues < ActiveRecord::Migration
  def change
    create_table :snp_values do |t|
      t.string :base_pair
      t.string :location

      t.timestamps null: false
    end
  end
end
