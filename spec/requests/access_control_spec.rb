require 'rails_helper'

RSpec.describe "AccessControl", type: :request do
  describe "POST /login" do
    let(:user) { create(:access_control_user) }

    context "with valid credentials" do
      it "logs in and redirects to home" do
        post '/login', params: { email: user.email, password: user.password }
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid credentials" do
      it "returns unprocessable_entity status" do
        post '/login', params: { email: user.email, password: 'wrong_password' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "POST /register" do
    context "with valid parameters" do
      it "creates a new user and redirects to login" do
        post '/register', params: { user: { name: 'Test User', email: 'test@example.com', password: 'password123', password_confirmation: 'password123' } }
        expect(response).to redirect_to(login_path)
      end
    end

    context "with invalid parameters" do
      it "returns unprocessable_entity status" do
        post '/register', params: { user: { name: '', email: '', password: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
