class UsersController < ApplicationController
  def show
    @user = current_user
    if @user.researcher?
      @studies = @user.studies if @user.studies
      render "researcher/users/show"
    else
      render "participants/users/show"
    end
  end
end
