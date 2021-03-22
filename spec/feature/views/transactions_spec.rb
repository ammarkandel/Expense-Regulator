require 'spec_helper'

RSpec.describe 'Transaction Views', type: :feature do
  before(:each) do
    u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
    u1.save
    g1 = Group.new(name: 'testgroup 1', icon: 'fa-handshake', user_id: 1)
    g1.save
    visit '/'
    fill_in 'Email', with: 'test1@s.com'
    fill_in 'Password', with: '123456'
    click_button('Log in')
    expect(page).to have_content('Welcome:')
  end

  scenario 'visit all my expenses' do
    find('a', text: 'All my expenses').click
    expect(page).to have_content('Transactions')
  end

  scenario 'visit none grouped expenses' do
    find('a', text: 'None grouped expenses').click
    expect(page).to have_content('None Grouped')
  end

  scenario 'visit groups' do
    find('a', text: 'All my groups').click
    expect(page).to have_content('Groups')
  end

  scenario 'visit members expenses' do
    find('a', text: 'Members expenses').click
    expect(page).to have_content('Members Expenses')
  end

  scenario 'create new none grouped expense' do
    find('a', text: 'None grouped expenses').click
    find(:xpath, "//a[@href='/transactions/new']").click
    fill_in 'Name', with: 'test'
    fill_in 'Amount', with: '123'
    click_button('Create Transaction')
    expect(page).to have_content('None Grouped')
  end
end
