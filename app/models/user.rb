class User < ActiveRecord::Base
  has_one :participant_credential
  validates :email, presence: true

  def self.find_or_create_from_auth(user_info)
    where(email: user_info[:email]).first_or_create do |user|
      user.first_name   = user_info[:first_name]
      user.last_name    = user_info[:last_name]
      user.email        = user_info[:email]
    end
  end
end
