require 'rails_helper'

feature "user changes password on edit user page" do
  scenario "rerenders the dashboard page with a message password is saved" do
    user = create(:participant, password: "password")
    log_in(user)

    visit edit_user_path(user)

    fill_in "New password", with: "newpassword"
    fill_in "Confirm new password", with: "newpassword"
    click_on "Submit"

    expect(page).to have_content("Your password has been successfully changed")
    expect(current_path).to eq(dashboard_path)
  end

  scenario "with mismatched password confirmation" do
    user = create(:participant, password: "password")
    log_in(user)

    visit edit_user_path(user)

    fill_in "New password", with: "newpassword"
    fill_in "Confirm new password", with: "wrongpassword"
    click_on "Submit"

    expect(page).to have_content("Please check your password entry and try again")
    expect(current_path).to eq(edit_user_path(user))
  end
end
