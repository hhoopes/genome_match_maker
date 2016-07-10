class StudiesController < ApplicationController
  def show
    @study = Study.find(params[:id])
    MatchMaker.generate_matches([@study], User.participants)
  end

  def index
    @studies = Study.all
    # binding.pry
  end
end
