class AndMeAuthService
  def get_token(code)
    token_response = {}
    response = Net::HTTP.post_form(URI("https://api.23andme.com/token"), token_params(code)).body
    parsed  = JSON.parse(response)
    binding.pry
    token_response[:refresh_token]   = parsed["refresh_token"]
    token_response[:access_token]    = parsed["access_token"]
    token_response
  end

  def get_user_info(token)
    service = UserService.new(token)
    {profile_id: service.profile_id, email: service.email, first_name: service.first_name}
  end

  private
    def token_params(code)
      {
        "client_id"         => ENV["23_and_me_id"],
        "client_secret"     => ENV["23_and_me_secret"],
        "grant_type"        => "authorization_code",
        "code"              => code,
        "redirect_uri"      => "http://localhost:3000/auth/and_me/callback",
        "scope"             => "basic haplogroups email ancestry names profile:read profile:write",
      }
    end
end
