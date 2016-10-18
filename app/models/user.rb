class User < ActiveRecord::Base
  has_secure_password
  has_one :participant_credential, dependent: :destroy
  has_one :researcher_credential, dependent: :destroy
  has_many :studies
  has_many :snps, as: :snppable
  has_many :snp_values, through: :snps
  has_many :locations, through: :snp_values
  has_many :study_participations, dependent: :destroy
  validates :email, presence: true
  validates :password, confirmation: true

  scope :participants, -> { joins(:participant_credential) }
  scope :researchers, -> { joins(:researcher_credential) }

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

  def has_matches?
    study_participations.count > 0
  end

  def full_name
    first_name.capitalize + " " + last_name.capitalize.gsub("phd", "PhD")
  end
end
