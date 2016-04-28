class Participant::UsersController < ApplicationController
  def create
    @user = UserCreator.create_user(params[:code])

    if @user.save && @user.participant_credential.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end
end
