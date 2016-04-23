class User < ActiveRecord::Base
  has_secure_password
  has_one :participant_credential, dependent: :destroy
  has_one :researcher_credential, dependent: :destroy
  has_many :studies
  has_many :snps, as: :snppable
  validates :email, presence: true

  def self.find_or_create_from_auth(user_info)
    where(email: user_info[:email]).first_or_create do |user|
      user.first_name   = user_info[:first_name]
      user.last_name    = user_info[:last_name]
      user.email        = user_info[:email]
      user.password     = ENV["DEFAULT_PASSWORD"]
    end
  end

  def participant?
    participant_credential != nil
  end

  def researcher?
    researcher_credential != nil
  end

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end

  def matches
    matches = []
    if self.participant?
      generate_snps
      svs = self.snps.all.collect {|snp| snp.snp_value }

      Study.all.each do | study |
        ssvs = study.snps.all.collect {|snp| snp.snp_value}
        ssvs.each do |snp_value|
          if svs.include?(snp_value)
            matches << study
          end
        end
      end
    end
    matches
  end

  def generate_snps
    missing = []
    locations =
    self.snps.collect do |user_snp|
      user_snp.location
    end
    Snp.where(snppable_type: "Study").all.each do | snp |
      next if locations.include?(snp.location)
      missing << snp.location.position
    end
    missing.each do |position|
      service = SnpService.new(self.participant_credential.access_token, self)
      bp = service.find_basepairs(position)
      location = Location.find_by(position: position)
      sv = SnpValue.where(base_pair: bp, location_id: location.id).first_or_create(base_pair: bp, location_id: location.id)
      self.snps << Snp.create(snppable_type: "user", snppable_id: self.id, snp_value_id: sv.id)
    end
  end
end
