FactoryBot.define do
  factory :access_control_user, class: 'AccessControl::User' do
    name { 'John Doe' }
    email { 'johndoe@example.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
