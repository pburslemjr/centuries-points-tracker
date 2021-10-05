require 'rails_helper'

RSpec.describe 'Updating a service logger entry', type: :feature do
    scenario 'valid inputs' do
      orientation = ServiceHour.create!(description: 'anything')
      visit edit_service_logger_path(id: orientation.id)
      fill_in 'Description', with: 'new description'
      click_on 'Edit Time'
      visit service_logger_index_path
      expect(page).to have_content('new description')
    end
  end