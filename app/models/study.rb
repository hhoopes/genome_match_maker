class Study < ActiveRecord::Base
  belongs_to :user
  has_many :snps, as: :snppable
  has_many :snp_values, through: :snps
  accepts_nested_attributes_for :snps
end