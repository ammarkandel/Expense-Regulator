require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    u1 = User.new({ name: 'Test1', email: 'test1@40.com', password: '12345678', password_confirmation: '12345678' })
    u1.save
  end

  context 'test group model' do
    it 'return true if group is invalid duplicate name' do
      g1 = Group.new(name: 'testgroup 1', icon: 'fa-handshake', user_id: 1)
      g1.save
      g1 = Group.new(name: 'testgroup 1', icon: 'fa-handshake', user_id: 1)
      expect(g1.valid?).to eq(false)
    end

    it 'return true if group is missing the name' do
      g1 = Group.new(icon: 'fa-handshake', user_id: 1)
      expect(g1.valid?).to eq(false)
    end
  end
end
