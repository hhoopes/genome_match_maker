require "simplecov"
require 'capybara-webkit'
SimpleCov.start("rails")

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f }

module WaitForAjax
  def wait_for_ajax
    Capybara.default_max_wait_time = 10
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end
  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end


RSpec.configure do |config|
  config.include WaitForAjax, type: :feature
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  Capybara.javascript_driver = :webkit

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  def token_response
    {
      "access_token"=>"sample_access_token",
      "token_type"=>"bearer",
      "expires_in"=>86400,
      "refresh_token"=>"sample_refresh_token",
      "scope"=>"basic email genomes"}
  end

  def token_hash
    {:refresh_token=> refresh_token, :access_token=> valid_token}
  end

  def auth_response
    {"code"=>"9766a203b1275288e09bc99f78981659", "controller"=>"participant/users", "action"=>"create"}
  end

  def valid_token
    ENV["ACCESS_TOKEN"]
  end

  def refresh_token
    ENV["REFRESH_TOKEN"]
  end

  def log_in(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Login"
  end

  def generated_snp(position, base_pair, snppable_type)
    location = Location.where(position: position).first_or_create
    location.snp_values << SnpValue.where(base_pair: base_pair, location_id: location.id).first_or_create
    create(:snp, snppable_type: snppable_type, snp_value: SnpValue.last)
  end
end
