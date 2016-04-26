module ApplicationHelper
  def researcher?
    current_user && current_user.researcher?
  end

  def participant?
    current_user && current_user.participant?
  end

  def study_participations_cache(view)
    "#{view}-StudyParticipation-#{StudyParticipation.count}-#{StudyParticipation.maximum(:updated_at)}"
  end
end
