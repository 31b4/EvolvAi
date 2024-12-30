require 'rails_helper'

RSpec.describe AccessControl::RegisterController, type: :controller do
  # Testing the GET #register action
  describe 'GET #register' do
    it 'assigns a new user to @user' do
      # Simulate a GET request to the register action
      get :register
      # Expect that @user is a new AccessControl::User object
      expect(assigns(:user)).to be_a_new(AccessControl::User)
    end
  end

  # Testing the POST #create action
  describe 'POST #create' do
    # Context where valid attributes are provided
    context 'with valid attributes' do
      it 'creates a new user and redirects to login page with a success notice' do
        # Simulate a POST request to the create action with valid user attributes
        post :create, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password123' } }

        # Verify that a new user has been created in the database
        expect(AccessControl::User.count).to eq(1)

        # Verify that the user is redirected to the login page after successful registration
        expect(response).to redirect_to(login_path)

        # Check that the success flash message is set correctly
        expect(flash[:notice]).to eq('Registration successful! Please login.')
      end
    end

    # Context where invalid attributes are provided
    context 'with invalid attributes' do
      it 'does not create a new user and renders the register template with an error' do
        # Simulate a POST request to the create action with invalid user attributes
        post :create, params: { user: { name: '', email: 'invalidemail', password: '' } }

        # Verify that no user was created in the database
        expect(AccessControl::User.count).to eq(0)

        # Verify that the user is rendered back to the register template
        expect(response).to render_template(:register)

        # Check that the error flash message is set correctly
        expect(flash.now[:alert]).to eq('There was a problem with your registration. Please try again.')
      end
    end
  end
end
