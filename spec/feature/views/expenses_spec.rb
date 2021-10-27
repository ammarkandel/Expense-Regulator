require 'spec_helper'

RSpec.describe 'Expense Views', type: :feature do
  before(:each) do
    visit '/'
    fill_in 'Email', with: 'test1@s.com'
    fill_in 'Password', with: '123456'
    click_button('Log in')
    expect(page).to have_content('Welcome:')
  end

  it 'visit all my expenses' do
    find('a', text: 'All expenses').click
    expect(page).to have_content('Expenses')
  end

  it 'visit none grouped expenses' do
    find('a', text: 'ungrouped expenses').click
    expect(page).to have_content('Ungrouped expenses')
  end

  it 'visit groups' do
    find('a', text: 'groups').click
    expect(page).to have_content('Groups')
  end

  it 'visit members expenses' do
    find('a', text: 'Members').click
    expect(page).to have_content('Members total expenses')
  end

  it 'create new none grouped expense' do
    find('a', text: 'ungrouped expenses').click
    expect(page).to have_content('Ungrouped expenses')
    find('a', text: 'Add New Transaction').click
    fill_in 'Name', with: 'test'
    fill_in 'Amount', with: '123'
    click_button('Create Expense')
    expect(page).to have_content('Expenses')
    expect(page).to have_content('test')
  end
end
