class Participant::SessionsController < ApplicationController
  def create
    auth = AndMeAuthService.new
    token_hash = auth.get_token(params[:code])
    user_info = auth.get_user_info(token_hash[:access_token])
    user = User.find_or_create_with_auth(token_hash, user_info)
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
