class UsersController < ApplicationController
  def show
    @user = current_user
    if @user.researcher?
      @studies = @user.studies
      MatchMaker.generate_matches(@studies, User.participants)
      render "researcher/users/show"
    elsif @user.participant?
      MatchMaker.generate_matches("all", [@user])
      render "participants/users/show"
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params["id"])
  end

  def update
    @user = User.find(params["id"])
    if @user.update(user_params)
      flash[:info] = "Your password has been successfully changed"
      redirect_to dashboard_path
    else
      flash[:error] = "Please check your password entry and try again"
      redirect_to edit_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
