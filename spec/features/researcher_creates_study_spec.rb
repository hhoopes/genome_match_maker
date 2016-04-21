require 'rails_helper'

feature "researcher creates new study" do
  scenario "and they see their new study on their dashboard" do
    researcher = create(:researcher).user
    log_in(researcher)

    visit dashboard_path
    click_on "Create new study"

    expect(current_path).to eq("/new_study_path")
    expect(page).to have_content("Create a New Research Study")
    fill_in "Name of Study", with: "ADHD Genetic Research Study"
    fill_in "Description", with:
    "Attention Deficit Hyperactivity Disorder (ADHD) often is genetic."
  end 
end
