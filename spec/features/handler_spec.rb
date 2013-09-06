require 'spec_helper'

describe "viewing an application's report" do

  let(:request_data) {
    {
      application_name: 'SuperDooperApp',
      time_in_ruby: 20,
      time_in_db:   3,
      time_rendering: 100
    }
  }

  let(:handler) { Handler.new(request_data) }

  it 'shows the report', js: true do
    pending 'fix this test'
    handler.log
    app = Application.last
    visit application_report_path(app.id)
    save_and_open_page
    expect(page).to have_selector('.jqplot-target')
  end
end
