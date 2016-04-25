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
end
