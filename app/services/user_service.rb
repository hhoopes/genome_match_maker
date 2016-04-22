class UserService < AndMeApiService
  def email
    response = get("/user/?email=true")
    response["email"]
  end

  def uid
    response = get("/user")
    response["profiles"].first["id"]
  end

  def first_name
    response = get("/names/#{uid}")
    response["first_name"]
  end

  def last_name
    response = get("/names/#{uid}")
    response["last_name"]
  end
end
