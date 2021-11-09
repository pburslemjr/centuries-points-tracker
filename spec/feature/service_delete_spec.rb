require 'rails_helper'

RSpec.describe 'Deleting a service logger entry', type: :feature do
  before do
    Service.create!(description: 'not important', hours: 4, date: '10-05-2021',
                    isApproved: false)
  end

  it 'success' do
    login
    visit services_path
    expect(page).to have_content('not important')
    click_on 'Delete'
    click_on 'Delete Service'
    visit services_path
    expect(page).not_to have_content('not important')
  end
end
