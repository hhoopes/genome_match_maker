class User < ActiveRecord::Base
  has_secure_password
  has_one :participant_credential, dependent: :destroy
  has_one :researcher_credential, dependent: :destroy
  validates :email, presence: true

  def self.find_or_create_from_auth(user_info)
    binding.pry
    where(email: user_info[:email]).first_or_create do |user|
      user.first_name   = user_info[:first_name]
      user.last_name    = user_info[:last_name]
      user.email        = user_info[:email]
      user.password     = ENV["DEFAULT_PASSWORD"]
    end
  end
end
