require 'rails_helper'

RSpec.describe 'Deleting an event', type: :feature do
  before do
    Event.create!(name: 'Orientation', description: 'not important')
  end

  it 'success' do
    visit '/'
    click_on 'Login with Google'
    visit events_path
    expect(page).to have_content('Orientation')
    click_on 'Delete'
    click_on 'Delete Event'
    visit events_path
    expect(page).not_to have_content('Orientation')
  end
end
