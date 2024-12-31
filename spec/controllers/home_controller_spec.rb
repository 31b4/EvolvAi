require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    context 'when the user is logged in' do
      let(:user) { FactoryBot.create(:user) }

      before do
        sign_in user
      end

      it 'returns a successful response' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not logged in' do
      it 'redirects to the login page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
