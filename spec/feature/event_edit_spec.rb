require 'rails_helper'

RSpec.describe 'Updating an event', type: :feature do
  it 'valid inputs' do
    orientation = Event.create!(name: 'Orientation', description: 'for new members')
    visit edit_event_path(id: orientation.id)
    fill_in 'Name', with: 'New member orientation'
    click_on 'Edit Event'
    visit events_path
    expect(page).to have_content('New member orientation')
  end
end
