class SnpValue < ActiveRecord::Base
  has_many :snps
  belongs_to :location
  has_many :studies, through: :snps
  accepts_nested_attributes_for :location
end
