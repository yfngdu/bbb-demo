require 'spec_helper'
load File.expand_path('../../../app/helpers/prepare.rb', __FILE__)

RSpec.feature "Get recordings: " do
  scenario "Check recordings on home page" do
    prepare
    response = @api.get_recordings
    if response[:recordings].length > 1
      visit root_path
      m = response[:recordings][0]
      expect(page).to have_css('#row_' + m[:recordID])
      find('#delete_recording_' + m[:recordID]).click

      expect(page).not_to have_css('#row_' + m[:recordID])
      visit root_path
      expect(page).not_to have_css('#row_' + m[:recordID])
    else
      pending "A recording must be made before it can be deleted."
    end
  end
end
