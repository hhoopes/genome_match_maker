class RemoveLocationFromSnpValue < ActiveRecord::Migration
  def change
    remove_column :snp_values, :location, :string
  end
end
