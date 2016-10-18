class StudyService
  def self.create_study(params)
    Study.create do | study |
      study.name = params[:name]
      study.description = params[:description]
      study.snp_values = return_snp_value_array(params[:snps_attributes])
    end
  end

  def self.return_snp_value_array(snp_collection)
    snp_collection.map do | index, snp_value |
      location_id = Location.find_by(position: snp_value[:snp_value_attributes][:location_attributes][:position]).id
      base_pair = snp_value[:snp_value_attributes][:base_pair]
      SnpValue.where(base_pair: base_pair, location_id: location_id).first_or_create(base_pair: base_pair, location_id: location_id)
    end
  end
end
