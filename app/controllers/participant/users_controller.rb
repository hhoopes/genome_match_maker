class Participant::UsersController < ApplicationController
  def create
    binding.pry
    token_hash = AndMeAuthService.get_token(params[:code])
    user_info = AndMeAuthService.get_user_info(token_hash[:access_token])
    user = User.find_or_create_from_auth(user_info)
    user.participant_credential = ParticipantCredential.find_or_create_from_auth(token_hash, user_info)

    if user.save && user.participant_credential.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end
end
