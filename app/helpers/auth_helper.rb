module AuthHelper
  def client_id
    ENV["23_and_me_id"]
  end

  def callback_host
    ENV["callback_host"]
  end
end
