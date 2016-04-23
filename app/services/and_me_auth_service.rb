class AndMeAuthService
  def self.get_token(code)
    token_response = {}
    response = Net::HTTP.post_form(URI("https://api.23andme.com/token"), token_params(code)).body

    parsed  = JSON.parse(response)
    token_response[:refresh_token]   = parsed["refresh_token"]
    token_response[:access_token]    = parsed["access_token"]
    token_response
  end

  def self.get_user_info(token)
    service = UserService.new(token)
    {uid: service.uid, email: service.email, first_name: service.first_name, last_name: service.last_name}
  end

  private
    def self.token_params(code)
      {
        "client_id"         => ENV["and_me_id"],
        "client_secret"     => ENV["and_me_secret"],
        "grant_type"        => "authorization_code",
        "code"              => code,
        "redirect_uri"      => ENV["callback_host"],
        "scope"             => "basic email genomes names",
      }
    end
end
