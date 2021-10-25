require 'rails_helper'

RSpec.describe 'Updating an event', type: :feature do

before do
    @orientation = Event.create!(name: 'Orientation', description: 'for new members')
end

  it 'valid inputs' do
    visit '/'
    click_on 'Login with Google'
    visit edit_event_path(id: @orientation.id)
    fill_in 'Name', with: 'New member orientation'
    click_on 'Edit Event'
    visit events_path
    expect(page).to have_content('New member orientation')
  end
end
