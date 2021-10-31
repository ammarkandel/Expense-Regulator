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

    it 'Expected not valid with the name is less characters' do
      subject.name = 'cc'

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

    it 'Expected not valid with the less characters' do
      subject.password = '123'
      subject.password_confirmation = '123'

      expect(subject).to_not be_valid
    end

    it 'Expected not valid with the password_confirmation not equal the password' do
      subject.password = '123456789'
      subject.password_confirmation = '12345678'

      expect(subject).to_not be_valid
    end

    it 'Expected not valid without the email' do
      subject.email = nil

      expect(subject).to_not be_valid
    end

    it 'Expected not valid with invalid email' do
      subject.email = 'invalidemail.com'

      expect(subject).to_not be_valid
    end
  end
end
