# https://www.codewithjason.com/rails-integration-tests-rspec-capybara/

require 'rails_helper'

RSpec.describe 'Creating a service logger entry', type: :feature do
  it 'valid inputs' do
    login
    visit new_service_path
    fill_in 'Hours', with: '80'
    fill_in 'Description', with: 'bla bla bla'
    fill_in 'Date', with: '2021-10-05'
    click_on 'Create Service'
    visit services_path
    expect(page).to have_content('80')
    expect(page).to have_content('bla bla bla')
    expect(page).to have_content('10/05/2021')
  end

  it 'not logged in' do
    visit new_service_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
