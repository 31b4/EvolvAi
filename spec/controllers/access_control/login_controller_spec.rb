require 'rails_helper'

RSpec.describe AccessControl::LoginController, type: :controller do
  let!(:user) { create(:access_control_user, email: 'johndoe@example.com', password: 'password123', password_confirmation: 'password123') }

  describe 'GET #login' do
    it 'assigns a new user to @user' do
      get :login
      expect(assigns(:user)).to be_a_new(AccessControl::User)
    end
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      it 'logs the user in and redirects to root path' do
        post :create, params: { email: user.email, password: 'password123' }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Logged in successfully!')
      end
    end

    context 'with invalid credentials' do
      it 'does not log the user in and renders the login template' do
        post :create, params: { email: user.email, password: 'wrongpassword' }
        expect(session[:user_id]).to be_nil
        expect(response).to render_template(:login)
        expect(flash.now[:alert]).to eq('Invalid email or password')
      end

      it 'renders the login template for non-existent user' do
        post :create, params: { email: 'nonexistent@example.com', password: 'password123' }
        expect(session[:user_id]).to be_nil
        expect(response).to render_template(:login)
        expect(flash.now[:alert]).to eq('Invalid email or password')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs the user out and redirects to root path' do
      session[:user_id] = user.id
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Logged out successfully!')
    end
  end
end
