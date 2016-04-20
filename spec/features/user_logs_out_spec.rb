require 'rails_helper'

feature "User logs out" do
  scenario "they no longer see their information" do
    user = create(:user)
    log_in(user)

    visit "/"
    expect(page).to have_content("Welcome, #{user.first_name}")

    click_link "Logout"
    save_and_open_page
    expect(current_path).to eq("/")
    expect(page).not_to have_content("Welcome, #{user.first_name}")
    expect(page).to have_content("Sign in with 23andMe")
  end
end
