require 'rails_helper'

RSpec.describe AccessControl::User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = build(:access_control_user)  #Use factory bot
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = build(:access_control_user, name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an email' do
      user = build(:access_control_user, email: nil)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid with a duplicate email' do
      create(:access_control_user, email: 'johndoe@example.com')
      user = build(:access_control_user, email: 'johndoe@example.com')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'is invalid with a password shorter than 6 characters' do
      user = build(:access_control_user, password: '12345', password_confirmation: '12345')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  end

  describe 'password encryption' do
    it 'encrypts the password using has_secure_password' do
      user = create(:access_control_user, password: 'password123', password_confirmation: 'password123')
      expect(user.authenticate('password123')).to eq(user)
      expect(user.authenticate('wrongpassword')).to be_falsey
    end
  end
end