require 'rails_helper'

RSpec.describe Group, type: :model do
  subject {
    Group.new(name: 'group name', icon: 'default-group', user_id: 1)
  }

  it { should belong_to(:user).without_validating_presence }

  it 'Expected group to be valid if add all attributes' do
    expect(subject).to be_valid
  end

  it 'Expected group to be invalid if missing name' do
    subject.name = nil

    expect(subject).to_not be_valid
  end

  it 'Expected group to be invalid if missing icon' do
    subject.icon = nil

    expect(subject).to_not be_valid
  end

  it 'Expected group to be invalid missing user' do
    subject.user_id = nil

    expect(subject).to_not be_valid
  end
end
