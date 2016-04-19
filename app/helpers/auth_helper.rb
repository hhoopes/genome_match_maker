module AuthHelper
  def client_id
    if Rails.env.development?
      "fa14c16e8d247c33723730c697802dd9"
    elsif Rails.env.production?
      "09473550b287dc2e71288d0b8c7c76fe"
    end
  end
end
