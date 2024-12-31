require 'rails_helper'

RSpec.describe 'Devise Requests', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /sign_in' do
    it 'renders the sign_in page' do
      get new_user_session_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /sign_up' do
    it 'renders the sign_up page' do
      get new_user_registration_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /sign_in' do
    let(:user) { create(:user) }

    it 'logs in the user successfully' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      follow_redirect!
      expect(response).to have_http_status(:ok)
      # Assuming "Welcome" is part of the content displayed after successful login
      expect(response.body).to include('Welcome')
    end
  end

  describe 'DELETE /sign_out' do
    let(:user) { create(:user) }

    before { sign_in user }

    it 'logs out the user successfully' do
      delete destroy_user_session_path
      follow_redirect!

      # Adjust assertion to target the "Sign in" link or a more specific element
      expect(response.body).to have_css('a', text: 'Sign in')
    end
  end
end