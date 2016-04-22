class Researcher::StudiesController < ApplicationController
  def new
    @study = Study.new
    @study.snps.build.build_snp_value
  end

  def create
    @researcher = current_user
    @researcher.studies << Study.new(study_params)
    @study = Study.last
    if @study.save
      redirect_to dashboard_path
    end
  end

  private
    def study_params
      params.require(:study)
      .permit(:name, :description, :snppable,
        snps_attributes:[:snppable_type, :snppable_id,
          snp_value_attributes: [:location, :base_pair]])
    end
end
