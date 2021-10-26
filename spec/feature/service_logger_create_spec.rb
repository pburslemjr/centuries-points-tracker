# https://www.codewithjason.com/rails-integration-tests-rspec-capybara/

require 'rails_helper'

RSpec.describe 'Creating a service logger entry', type: :feature do
  it 'valid inputs' do
    visit new_service_logger_path
    fill_in 'Hours', with: '80'
    fill_in 'Description', with: 'bla bla bla'
    fill_in 'Date', with: '2021-10-05'
    click_on 'Submit Time'
    visit service_logger_index_path
    expect(page).to have_content('80')
    expect(page).to have_content('bla bla bla')
    expect(page).to have_content('2021-10-05')
  end
end
