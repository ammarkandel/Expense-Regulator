require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(email: 'test12@s.com',
             name: 'Test21',
             password: '123456', password_confirmation: '123456')
  }

  context 'test user validation' do
    it 'Expected valid if user with valid attributes' do
      expect(subject).to be_valid
    end

    it 'Expected not valid without the name' do
      subject.name = nil

      expect(subject).to_not be_valid
    end

    it 'Expected not valid without the password' do
      subject.password = nil

      expect(subject).to_not be_valid
    end

    it 'Expected not valid without the password_confirmation' do
      subject.password_confirmation = nil

      expect(subject).to_not be_valid
    end

    it 'Expected not valid without the email' do
      subject.email = nil

      expect(subject).to_not be_valid
    end
  end
end
