require 'rails_helper'

RSpec.describe 'Updating a service logger entry', type: :feature do
  it 'valid inputs' do
    login
    orientation = Service.create!(description: 'anything', hours: 4, date: '2021-10-05',
                                  isApproved: false)
    visit edit_service_path(id: orientation.id)
    fill_in 'Description', with: 'new description'
    click_on 'Edit Service'
    expect(page).to have_content('new description')
  end

  it 'invalid inputs' do
    login
    orientation = Service.create!(description: 'anything', hours: 4, date: '2021-10-05',
                                  isApproved: false)
    visit edit_service_path(id: orientation.id)
    fill_in 'Description', with: ''
    click_on 'Edit Service'
    expect(page).to have_content('Description is too short')
  end
end
