class ParticipantCredential < ActiveRecord::Base
  belongs_to :user
  validates :uid, uniqueness: true

  def self.find_or_create_from_auth(token_hash, user_info)
    where(uid: user_info[:uid]).first_or_create do | participant_credential |
      participant_credential.uid = user_info[:uid]
      participant_credential.access_token = token_hash[:access_token]
      participant_credential.refresh_token = token_hash[:refresh_token]
    end
  end
end
