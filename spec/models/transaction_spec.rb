require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before(:each) do
    u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
    u1.save
    g1 = Group.new(name: 'testgroup 1', icon: 'fa-handshake', user_id: 1)
    g1.save
  end

  context 'test transaction model' do
    it 'return false if created transaction is invalid missing name' do
      e1 = Transaction.new(amount: 25, user_id: 1, group_id: 1)
      e1.save
      expect(e1.valid?).to eq(false)
    end

    it 'return false if created transaction is invalid missing amount' do
      e1 = Transaction.new(name: 'Food', user_id: 1, group_id: 1)
      e1.save
      expect(e1.valid?).to eq(false)
    end
  end
end
