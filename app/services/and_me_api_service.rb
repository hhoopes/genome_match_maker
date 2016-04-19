class AndMeApiService
  attr_reader :host, :current_user, :post_headers

  def initialize(token, current_user = current_user)
    @current_user = current_user
    @host = "https://api.23andme.com/1"
    @headers = { "Authorization" => "Bearer #{token}" }
    @post_headers = @headers.merge({"Content-Type" => "application/json"})
  end

  def get(path)
    response = HTTParty.get(@host + path, headers: @headers)
  end

  def post(path, params)
    HTTParty.post(
      prepare_path(path),
      headers: post_headers,
      body: prepare_params(params)
    )
  end

  def prepare_params(params)
    JSON.generate(params)
  end

  private
    def parse(json_string)
      JSON.parse(json_string, symbolize_names: true)
    end
end
