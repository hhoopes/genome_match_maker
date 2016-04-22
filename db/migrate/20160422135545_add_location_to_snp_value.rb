class AddLocationToSnpValue < ActiveRecord::Migration
  def change
    add_reference :snp_values, :location, index: true, foreign_key: true
  end
end
