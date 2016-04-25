require 'rails_helper'

feature "researcher enters a SNP into study form" do
  xscenario "sees status of snp location", :js => true do
    researcher = create(:researcher)
    log_in(researcher)
    visit new_researcher_study_path
    expect(page).to have_css("span#result")

    find_field("snp-location-1").set("rs3094315")
    # find_field('snp-location-1').trigger(:blur)

    page.execute_script(<<-JS)
      $(document).trigger("blur");
    JS

    wait_for_ajax
    expect(page).to have_css('span.glyphicon-ok')
    expect(page).not_to have_css('span.glyphicon-remove')
  end
end
