require 'rails_helper'

RSpec.describe User, type: :model do
  # Teszteljük az alapértelmezett Devise validációkat
  it 'is valid with valid attributes' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with an invalid email' do
    user = FactoryBot.build(:user, email: 'invalid_email')
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = FactoryBot.build(:user, password: nil, password_confirmation: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid if passwords do not match' do
    user = FactoryBot.build(:user, password: 'password123', password_confirmation: 'mismatch123')
    expect(user).to_not be_valid
  end

  # Teszteljük a Devise :database_authenticatable modult
  it 'authenticates with valid credentials' do
    user = FactoryBot.create(:user)
    expect(user.valid_password?('password')).to be_truthy
  end

  it 'does not authenticate with invalid credentials' do
    user = FactoryBot.create(:user)
    expect(user.valid_password?('wrongpassword')).to be_falsey
  end

  # Teszteljük a Devise :rememberable modult
  it 'generates a remember token when remembered' do
    user = FactoryBot.create(:user)
    user.remember_me!
    user.save
    expect(user.remember_created_at).to be_present
  end

end
