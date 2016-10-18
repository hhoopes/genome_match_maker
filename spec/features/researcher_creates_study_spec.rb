require 'rails_helper'

feature "researcher creates new study" do
  scenario "and they see their new study on their dashboard" do
    Location.create(position: "rs3094315")
    researcher = create(:researcher)
    log_in(researcher)

    visit dashboard_path
    click_on "Create new study"

    expect(current_path).to eq(new_researcher_study_path)
    expect(page).to have_content("Create a New Research Study")

    fill_in "Name of Study", with: "ADHD Genetic Research Study"
    fill_in "Description", with:
    "Attention Deficit Hyperactivity Disorder (ADHD) often is genetic."
    find_field("snp-location-1").set("rs3094315")
    find_field("snp-bp-1").set("AA")

    click_on "Submit new study"

    study = Study.last
    expect(current_path).to eq(study_path(study))
    expect(page).to have_content("Your Research Studies")

    expect(page).to have_content("ADHD Genetic Research Study")
    expect(page).to have_content(study.description)
    expect(page).to have_content("rs3094315")
    expect(page).to have_content("AA")
  end
end
