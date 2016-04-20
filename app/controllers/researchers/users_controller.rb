class Researchers::UsersController < ApplicationController
  def new
    @researcher = User.new
    @researcher.build_researcher_credential
  end

  def create
    @researcher = User.new(user_params)
    if @researcher.save
      session[:user_id] = @researcher.id
      @researcher.create_researcher_credential(researcher_credential_params)
      redirect_to dashboard_path
    else
      flash.now["error"] = @researcher.errors.full_messages
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def researcher_credential_params
      params.require(:researcher_credential).permit(:description, :organization)
    end

end
