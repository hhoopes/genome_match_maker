class UserService < AndMeApiService

  def and_me_id
    response = get("/user")
    response["id"]
  end

  def email
    response = get("/user/?email=true")
    response["email"]
  end

  def profile_id
    response = get("/user")
    response["profiles"].first["id"]
  end

  def first_name
    response = get("/names/#{profile_id}")
    response["first_name"]
  end

  private
end
