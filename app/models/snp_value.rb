class SnpValue < ActiveRecord::Base
  has_many :snps
  belongs_to :location
  has_many :studies, through: :snps, source: :snppable, source_type: "Study"
  has_many :users, through: :snps, source: :snppable, source_type: "User"
  accepts_nested_attributes_for :location

  before_validation :find_location

  def find_location
    self.location = Location.where(position: self.location.position).first_or_create
  end
end
