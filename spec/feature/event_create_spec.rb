# https://www.codewithjason.com/rails-integration-tests-rspec-capybara/

require 'rails_helper'

RSpec.describe 'Creating an event', type: :feature do
  scenario 'valid inputs' do
    visit new_event_path
    fill_in 'Name', with: 'Orientation for new members'
    fill_in 'Description', with: 'Get to meet the team, sign documents, and pay dues'
    fill_in 'Location', with: 'ZACH 207'
    fill_in 'Date', with: '2021-10-05'
    fill_in 'Time', with: '2000-01-01 17:30:00 UTC'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Orientation for new members')
    expect(page).to have_content('Get to meet the team, sign documents, and pay dues')
    expect(page).to have_content('ZACH 207')
    expect(page).to have_content('10/05/2021')
  end

  scenario "invalid inputs" do
    visit new_event_path
    fill_in 'Name', with: ''
    click_on 'Create Event'
    expect(page).to have_content("Name can't be blank")
  end

end
