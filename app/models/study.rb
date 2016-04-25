class Study < ActiveRecord::Base
  belongs_to :user
  has_many :snps, as: :snppable
  has_many :snp_values, through: :snps
  has_many :locations, through: :snp_values
  accepts_nested_attributes_for :snps
  has_many :study_participations

  def create_participant_matches
    User.generate_matches([self], "all")
  end
end
