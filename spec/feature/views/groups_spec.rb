require 'spec_helper'

RSpec.describe 'Groups Views', type: :feature do
  before(:each) do
    visit '/'
    fill_in 'Email', with: 'test1@s.com'
    fill_in 'Password', with: '123456'
    click_button('Log in')
    expect(page).to have_content('Welcome:')
  end

  it 'Test group views' do
    find('a', text: 'groups').click
    expect(page).to have_content('Groups')
    find(:xpath, "//a[@href='/groups/new']").click
    click_button('Create Group')
    expect(page).to have_content('Add new group')
    fill_in 'Name', with: 'Test group'
    click_button('Create Group')
  end
end
