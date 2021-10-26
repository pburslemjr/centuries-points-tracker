# https://www.codewithjason.com/rails-integration-tests-rspec-capybara/

require 'rails_helper'

def create_new_event
  visit new_event_path
  fill_in 'Name', with: 'Orientation for new members'
  fill_in 'Description', with: 'Get to meet the team, sign documents, and pay dues'
  fill_in 'Location', with: 'ZACH 207'
  click_on 'Create Event'
end

def user_shown_on_attendees_list
  'Ammar Siddiqi (ammar918@gmail.com)'
end

RSpec.describe 'Creating an event', type: :feature do
  # basic CRUD
  it 'valid inputs' do
    login
    create_new_event
    visit events_path
    expect(page).to have_content('Orientation for new members')
    expect(page).to have_content('Get to meet the team, sign documents, and pay dues')
    expect(page).to have_content('ZACH 207')
  end

  it 'invalid inputs' do
    login
    visit new_event_path
    fill_in 'Name', with: ''
    click_on 'Create Event'
    expect(page).to have_content("Name can't be blank")
  end

  # test attended
  # it 'attend then unattend' do
  #   login
  #   create_new_event
  #   visit events_path
  #   expect(page).to have_content('Attend')
  #   click_link 'Attend'
  #   expect(page).to have_content('Unattend')
  #   click_link 'Unattend'
  #   expect(page).to have_content('Attend')
  # end

  # it 'attend then show details' do
  #   login
  #   create_new_event
  #   visit events_path
  #   click_link 'Attend'
  #   click_link 'Details'
  #   expect(page).to have_content(user_shown_on_attendees_list)
  # end

  # it 'attend then unattend then show details' do
  #   login
  #   create_new_event
  #   visit events_path
  #   click_link 'Attend'
  #   click_link 'Details'
  #   expect(page).to have_content(user_shown_on_attendees_list)
  #   visit events_path
  #   click_link 'Unattend'
  #   click_link 'Details'
  #   expect(page).not_to have_content(user_shown_on_attendees_list)
  # end

  # test logging in
  it 'not logged in' do
    visit new_event_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
