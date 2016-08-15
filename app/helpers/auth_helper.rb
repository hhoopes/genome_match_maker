module AuthHelper
  def client_id
    ENV["and_me_id"]
  end

  def callback_host
    ENV["callback_host"] || "http://localhost:3000/auth/and_me/callback"
  end
end
