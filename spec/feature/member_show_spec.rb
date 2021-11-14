# https://www.codewithjason.com/rails-integration-tests-rspec-capybara/

require 'rails_helper'

RSpec.describe 'Show Members', type: :feature do
  # basic CRUD
  it 'visit members' do
    login_as_admin
    visit member_index_path
    
  end

  it 'sort members' do
    login_as_admin
    visit member_index_path
    click_on 'Missed Mandatory' 
    click_on 'Missed Mandatory' 
    click_on 'PP'
    click_on 'PP'
    click_on 'Hours'
    click_on 'Hours'
    
  end

  it 'view member' do
    login_as_admin
    visit member_index_path
    first('.item').click_link('Details')
  end

  it 'promote and demote member' do
    login_as_admin
    visit member_index_path
    first('.item').click_link('Make Member')
    expect(page).to have_content('Make Admin')
    first('.item').click_link('Make Admin')
    expect(page).to have_content('Make Member')
    
  end
end
