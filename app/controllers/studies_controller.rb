class StudiesController < ApplicationController
  def show
    @study = Study.find(params[:id])
    MatchMaker.generate_matches([@study], User.participants)
  end
end
