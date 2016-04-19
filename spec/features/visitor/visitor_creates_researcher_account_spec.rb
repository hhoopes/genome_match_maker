require 'rails_helper'

feature "Visitor can register as researcher" do
  scenario "they are redirected to dashboard" do
    visit '/'
    within(".login") do
      click_on "I am a researcher"
    end

    fill_in "Contact name", with: "Sally Researcher"
    fill_in "Organization", with: "My School"
    fill_in "Email", with: "sally@example.com"
    fill_in "Description", with: "A project that does cool things"
    # fill_in "SNPs of Focus", with: "add snps"

    click_on "Create Researcher Account"

    expect(page).to have_content("Welcome, Sally Researcher")
    expect(current_path).to eq("/dashboard")
  end
end
