require 'rails_helper'

feature "User logs out" do
  scenario "they no longer see their information" do
    user = create(:user)
    log_in(user)

    visit "/"
    expect(page).to have_content("Welcome, #{user.full_name}")
    expect(page).to have_content("Sign Out")
    click_link_or_button "Sign Out"

    expect(current_path).to eq("/")
    expect(page).not_to have_content("Welcome, #{user.full_name}")
    expect(page).to have_content("Log In")
  end
end
