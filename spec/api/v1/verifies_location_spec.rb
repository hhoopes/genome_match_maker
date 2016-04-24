require 'rails_helper'

describe "Verify Location API endpoints" do
  it "returns true or false if a location is queriable by 23" do
    real_location = Location.create(position: "rs28359175")

    get "/api/v1/verify_location/#{real_location.position}"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json["validity"]).to eq("true")

    get "/api/v1/verify_location/sofake"
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json["validity"]).to eq("false")
  end
end
