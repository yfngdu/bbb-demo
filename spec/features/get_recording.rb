require 'spec_helper'
load File.expand_path('../../../app/helpers/prepare.rb', __FILE__)

RSpec.feature "Delete recordings: " do
  scenario "Delete recordings on home page" do
    prepare
    response = @api.get_recordings
    visit root_path
    response[:recordings].each do |m|
      expect(page).to have_css('#row_' + m[:recordID])
    end
  end
end
