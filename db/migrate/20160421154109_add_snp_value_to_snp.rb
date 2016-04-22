class AddSnpValueToSnp < ActiveRecord::Migration
  def change
    add_reference :snps, :snp_value, index: true, foreign_key: true
  end
end
