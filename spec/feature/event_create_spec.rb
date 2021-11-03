# https://www.codewithjason.com/rails-integration-tests-rspec-capybara/

require 'rails_helper'

def create_test_event
  Event.create!(name: 'Anything', description: 'Lorem ipsum')
end

def user_shown_on_attendees_list
  'Paul Paul (paul-b-tamu@tamu.edu)'
end

RSpec.describe 'Creating an event', type: :feature do
  # basic CRUD
  it 'valid inputs with optional location' do
    login_as_admin
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

  it 'valid inputs with optional date/time' do
    login_as_admin
    visit new_event_path
    fill_in 'Name', with: 'Orientation for new members'
    fill_in 'Description', with: 'Get to meet the team, sign documents, and pay dues'
    fill_in 'Date', with: '18/12/2021'
    fill_in 'Time', with: '18:00'
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Orientation for new members')
    expect(page).to have_content('Get to meet the team, sign documents, and pay dues')
    expect(page).to have_content('12/18/2021 06:00 PM')
  end

  it 'invalid inputs with blank name' do
    login_as_admin
    visit new_event_path
    fill_in 'Name', with: ''
    click_on 'Create Event'
    expect(page).to have_content("Name can't be blank")
  end

  it 'invalid inputs with date but not time' do
    login_as_admin
    visit new_event_path
    fill_in 'Name', with: ''
    fill_in 'Date', with: '18/12/2021'
    click_on 'Create Event'
    expect(page).to have_content("Please enter both a day and time, or enter neither.")
  end

  # test attended
  it 'attend then unattend' do
    login_as_user
    create_test_event
    visit events_path
    expect(page).to have_content('Attend')
    click_link 'Attend'
    expect(page).to have_content('Unattend')
    click_link 'Unattend'
    expect(page).to have_content('Attend')
  end

  it 'attend then show details' do
    login_as_user
    create_test_event
    visit events_path
    click_link 'Attend'
    click_link 'Details'
    expect(page).to have_content(user_shown_on_attendees_list)
  end

  it 'attend then unattend then show details' do
    login_as_user
    create_test_event
    visit events_path
    click_link 'Attend'
    click_link 'Details'
    expect(page).to have_content(user_shown_on_attendees_list)
    visit events_path
    click_link 'Unattend'
    click_link 'Details'
    expect(page).not_to have_content(user_shown_on_attendees_list)
  end

  # test logging in
  it 'not logged in' do
    visit new_event_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
