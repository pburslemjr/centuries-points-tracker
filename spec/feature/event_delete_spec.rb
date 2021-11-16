require 'rails_helper'

RSpec.describe 'Deleting an event', type: :feature do
  before do
    Event.create!(name: 'Orientation', description: 'not important')
  end

  it 'success' do
    login_as_admin
    visit events_path
    expect(page).to have_content('Orientation')
    click_on 'Delete'
    click_on 'DELETE'
    visit events_path
    expect(page).not_to have_content('Orientation')
  end
end
