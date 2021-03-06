require 'rails_helper'

feature "Visitor logs in" do
  scenario "user is redirected to dashboard" do
    user = create(:participant, password: "password")

    visit "/"
    expect(page).not_to have_content("Welcome, #{user.full_name}")
    expect(page).to have_content("Sign Up")

    click_on "Log In"

    expect(page).to have_content("Log In to Genome Match Maker")
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome, #{user.full_name}")
  end

  scenario "wrong password rerenders login page" do
    visit "/"

    click_on "Log In"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "wrongpassword"
    click_on "Login"

    expect(page).to have_content("Invalid Login")
  end
end
