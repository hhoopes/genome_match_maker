class MatchMaker
  def self.generate_matches(study_array, user_array)
    user_array = User.participants if user_array == "all"
    study_array = Study.all if study_array == "all"

    user_array.each do |user|
      generate_snps(user)
      study_array.each do |study|
        study_matches(study, user)
      end
    end
  end

  def self.study_matches(study, user)
    if user.participant?
      all_studies = Study.find(Snp.where(snppable_type: "Study", snppable_id: study.id).where(snp_value_id: user.snps.pluck(:snp_value_id)).pluck(:snppable_id))

      StudyParticipation.add_participation(all_studies, user)
    end
  end

  def self.generate_snps(user)
    missing = []
    locations =
    user.snps.joins(:location)

    Snp.where(snppable_type: "Study").all.each do | snp |
      next if locations.include?(snp.location)
      missing << snp.location.position
    end

    missing = missing.uniq

    if missing
      missing.each do |position|
        Snp.create_snp(position, user)
      end
    end
  end
end
