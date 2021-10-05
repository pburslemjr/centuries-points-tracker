require 'rails_helper'

RSpec.describe 'Deleting a service logger entry', type: :feature do
  scenario 'success' do
    ServiceHour.create!(description: 'not important')
    visit service_logger_index_path
    expect(page).to have_content('not important')
    click_on 'Delete'
    click_on 'Delete Time'
    visit service_logger_index_path
    expect(page).not_to have_content('not important')
  end
end