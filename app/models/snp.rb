class Snp < ActiveRecord::Base
  belongs_to :study
  belongs_to :user
  belongs_to :snp_value
  has_one :location, through: :snp_value
  belongs_to :snppable, polymorphic: true
  accepts_nested_attributes_for :snp_value

  def create_for_participant(snp_array)
    
  end
end
