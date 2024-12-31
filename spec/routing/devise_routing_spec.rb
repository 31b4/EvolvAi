require 'rails_helper'

RSpec.describe 'Routing to Devise', type: :routing do
  # Test routing for the sign_in path
  it 'routes to the sign_in path' do
    expect(get: '/sign_in').to route_to(controller: 'devise/sessions', action: 'new')
  end

  # Test routing for the sign_out path
  it 'routes to the sign_out path' do
    expect(delete: '/sign_out').to route_to(controller: 'devise/sessions', action: 'destroy')
  end

  # Test routing for the sign_up path
  it 'routes to the sign_up path' do
    expect(get: '/sign_up').to route_to(controller: 'devise/registrations', action: 'new')
  end

  # Test routing for the root path
  it 'routes the root path' do
    expect(get: '/').to route_to(controller: 'home', action: 'index')
  end
end
