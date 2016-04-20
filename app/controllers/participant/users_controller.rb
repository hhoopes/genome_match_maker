class Participant::UsersController < ApplicationController
  def create
    token_hash = AndMeAuthService.get_token(params[:code])
    user_info = AndMeAuthService.get_user_info(token_hash[:access_token])
    credentials = ParticipantCredential.find_or_create_from_auth(token_hash, user_info)
    credentials.user = User.find_or_create_from_auth(user_info)
    user = credentials.user

    if user
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
