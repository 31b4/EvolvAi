FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }  # Ensures the email is unique for each user
    password { 'password' }
    password_confirmation { 'password' }
  end
end
