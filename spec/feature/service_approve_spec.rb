require 'rails_helper'

def create_new_service
  visit new_service_path
  fill_in 'Hours', with: '80'
  fill_in 'Description', with: 'bla bla bla'
  fill_in 'Date', with: '2021-10-05'
  click_on 'Create Service'
end

RSpec.describe 'Checking approved/unapproved services', type: :feature do
  it 'left unapproved' do
    login_as_admin
    create_new_service
    visit services_path
    expect(page).to have_css('img.x')
    expect(page).to have_content('80')
    expect(page).to have_content('bla bla bla')
    expect(page).to have_content('10/05/2021')
  end

  it 'make approved' do
    login_as_admin
    create_new_service
    visit services_path
    click_on 'Approve'
    expect(page).to have_css('img.check')
    expect(page).to have_content('80')
    expect(page).to have_content('bla bla bla')
    expect(page).to have_content('10/05/2021')
  end

  it 'not logged in' do
    visit new_service_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
