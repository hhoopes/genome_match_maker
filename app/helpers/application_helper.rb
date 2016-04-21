module ApplicationHelper
  def researcher?
    current_user && current_user.researcher?
  end

  def participant?
    current_user && current_user.participant?
  end
end
