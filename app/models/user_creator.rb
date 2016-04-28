class UserCreator
  def self.create_user(auth_code)
    token_hash = AndMeAuthService.get_token(auth_code)
    user_info = AndMeAuthService.get_user_info(token_hash[:access_token])
    user = User.find_or_create_from_auth(user_info)
    user.participant_credential = ParticipantCredential.find_or_create_from_auth(token_hash, user_info)
    user
  end
end
