class UsersController < ApplicationController
  def show
    @user = current_user
    if @user.researcher?
      @studies = @user.studies
      render "researcher/users/show"
    elsif @user.participant?
      @matches = @user.matches unless @user.matches.nil?
      render "participants/users/show"
    else
      redirect_to root_path
    end
  end
end
