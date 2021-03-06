require 'rails_helper'

RSpec.describe 'Updating an event', type: :feature do
  it 'valid inputs' do
    orientation = Event.create!(name: 'Orientation', description: 'for new members')
    visit '/'
    click_on 'Login with Google'
    visit edit_event_path(id: orientation.id)
    fill_in 'Name', with: 'New member orientation'
    click_on 'EDIT'
    visit events_path
    expect(page).to have_content('New member orientation')
  end

  it 'invalid inputs' do
    orientation = Event.create!(name: 'New member orientation', description: 'for new members')
    visit '/'
    click_on 'Login with Google'
    visit edit_event_path(id: orientation.id)
    fill_in 'Name', with: 'N'
    click_on 'EDIT'
    expect(page).to have_content('Name is too short')
  end
end
