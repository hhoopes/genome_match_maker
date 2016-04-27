class TokenRefresher < ActiveJob::Base
  queue_as :default

  def perform
    User.participants.all.each do | user |
      response = AndMeAuthService.get_token(user.participant_credential.refresh_token, "refresh_token")

      ParticipantCredential.find_by(user_id: user.id).update(response)
      user.reload.participant_credential
      user.save
    end

    User.participants.all.each do |user|
      user.reload.participant_credential
    end
  end
end
