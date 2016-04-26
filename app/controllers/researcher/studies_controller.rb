class Researcher::StudiesController < ApplicationController
  def new
    @study = Study.new
    @study.snps.build.build_snp_value.build_location
  end

  def create
    @researcher = current_user
    @researcher.studies << Study.create(study_params)
    @study = Study.last
    redirect_to dashboard_path
  end

  private
    def study_params
      params.require(:study)
      .permit(:name, :description, :snppable,
        snps_attributes:[:snppable_type, :snppable_id,
          snp_value_attributes: [:base_pair,
            location_attributes:[:position]
          ]])
    end
end
