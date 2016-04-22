require 'rails_helper'

feature "Visitor can register as researcher" do
  scenario "they are redirected to dashboard" do
    visit '/'
    within(".signup-researcher") do
      click_on "I am a researcher"
    end

    fill_in "First name", with: "Sally"
    fill_in "Last name", with: "Researcher"
    fill_in "Organization", with: "My School"
    fill_in "Description", with: "My research university is the bestest of the bestest"
    fill_in "Password", with: "superlegitpassword"
    fill_in "Email", with: "sally@example.com"

    click_on "Create Researcher Account"

    expect(page).to have_content("Welcome, Sally Researcher")
    expect(current_path).to eq(dashboard_path)
  end
end
