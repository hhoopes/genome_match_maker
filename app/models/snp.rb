class Snp < ActiveRecord::Base
  belongs_to :study
  belongs_to :user
  belongs_to :snp_value
  has_one :location, through: :snp_value
  belongs_to :snppable, polymorphic: true
  accepts_nested_attributes_for :snp_value

  def self.create_snp(position, user)
    service = SnpService.new(user.participant_credential.access_token, user)
    bp = service.find_basepairs(position)
    location = Location.find_by(position: position)
    sv = SnpValue.where(base_pair: bp, location_id: location.id).first_or_create(base_pair: bp, location_id: location.id)
    user.snps << where(snppable_type: "user", snppable_id: user.id, snp_value_id: sv.id).first_or_create
  end
end
