require 'rails_helper'

RSpec.describe User, type: :model do
  context 'test creation of user' do
    it 'return true if is created a valid user' do
      u1 = User.new({ email: 'test12@s.com', name: 'Test21', password: '123456', password_confirmation: '123456' })
      u1.save
      expect(u1.valid?).to eq(true)
    end

    it 'return false if is created invalid user with duplicate name' do
      u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
      u1.save
      u1 = User.new({ email: 'test1@as.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
      expect(u1.valid?).to eq(false)
    end

    it 'create invalid user with duplicate email' do
      u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
      u1.save
      u1 = User.new({ email: 'test1@s.com', name: 'Test1a', password: '123456', password_confirmation: '123456' })
      expect(u1.valid?).to eq(false)
    end
  end
end
