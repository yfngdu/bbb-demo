require 'spec_helper'

RSpec.feature "Create Meeting: " do
  scenario 'Go to home page' do
    visit root_path
    fill_in 'name', with: 'Amy'
    click_button "Enter"
    expect(page).to have_current_path(/amy.blindside-dev.com/, url: true)
  end
end
