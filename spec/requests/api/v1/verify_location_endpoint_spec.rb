require 'rails_helper'

describe "Verify location API endpoint" do
  it "returns true for a valid SNP location" do
    Location.create(position: "rs12393663")
    Location.create(position: "rs7177846")

    get "/api/v1/verify_location/#{Location.first.position}"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json["validity"]).to eq("true")
  end

  it "returns false for an invalid SNP location" do
    Location.create(position: "rs12393663")
    Location.create(position: "rs7177846")

    get "/api/v1/verify_location/rs12"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json["validity"]).to eq("false")

  end
end
