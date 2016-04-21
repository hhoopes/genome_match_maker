class SnpValue < ActiveRecord::Base
  has_many :snps
  has_many :studies, through: :snps
  validates_uniqueness_of :location, scope: :base_pair
end
