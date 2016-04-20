module AuthHelper
  def client_id
    ENV["and_me_id"]
  end

  def callback_host
    ENV["callback_host"]
  end
end
