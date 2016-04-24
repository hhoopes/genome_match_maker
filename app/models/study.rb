class Study < ActiveRecord::Base
  belongs_to :user
  has_many :snps, as: :snppable
  has_many :snp_values, through: :snps, source: :snppable, source_type: "Study"
  has_many :locations, through: :snp_values, source: :snppable, source_type: "Study"
  accepts_nested_attributes_for :snps
end
