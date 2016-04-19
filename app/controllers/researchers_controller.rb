class ResearchersController < ApplicationController
  def new
    @researcher = Researcher.new
  end

end
