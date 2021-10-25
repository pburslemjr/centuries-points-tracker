# https://www.codewithjason.com/rails-integration-tests-rspec-capybara/

require 'rails_helper'

RSpec.describe 'Creating an event', type: :feature do
  it 'valid inputs' do
    visit '/'
    click_on 'Login with Google'
    visit new_event_path
    fill_in 'Name', with: 'Orientation for new members'
    fill_in 'Description', with: 'Get to meet the team, sign documents, and pay dues'
    fill_in 'Location', with: 'ZACH 207'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Orientation for new members')
    expect(page).to have_content('Get to meet the team, sign documents, and pay dues')
    expect(page).to have_content('ZACH 207')
  end

  it 'invalid inputs' do
    visit '/'
    click_on 'Login with Google'
    visit new_event_path
    fill_in 'Name', with: ''
    click_on 'Create Event'
    expect(page).to have_content("Name can't be blank")
  end

  it 'not logged in' do
    visit new_event_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
