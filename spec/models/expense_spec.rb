require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject {
    Expense.new(name: 'expense name', amount: 40, user_id: 1)
  }

  it { should belong_to(:user) }

  it 'Expected expense to be valid if add all attributes' do
    expect(subject).to be_valid
  end

  it 'Expected expense to be invalid if missing name' do
    subject.name = nil

    expect(subject).to_not be_valid
  end

  it 'Expected expense to be invalid missing user' do
    subject.user_id = nil

    expect(subject).to_not be_valid
  end

  it 'Expected expense to be invalid if missing amount' do
    subject.amount = nil

    expect(subject).to_not be_valid
  end

  it 'Expected expense to be invalid if amount not number' do
    subject.amount = 'aa'

    expect(subject).to_not be_valid
  end

  it 'Expected expense to be valid if amount number in string' do
    subject.amount = '50'

    expect(subject).to be_valid
  end
end
