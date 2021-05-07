require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
    u1.save
  end

  context 'test expense model' do
    it 'return false if created expense is invalid missing name' do
      e1 = Expense.new(amount: 25, user_id: 1)
      e1.save
      expect(e1.valid?).to eq(false)
    end

    it 'return false if created expense is invalid missing amount' do
      e1 = Expense.new(name: 'Food', user_id: 1)
      e1.save
      expect(e1.valid?).to eq(false)
    end
  end
end
