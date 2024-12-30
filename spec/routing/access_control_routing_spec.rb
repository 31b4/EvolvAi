require 'rails_helper'

RSpec.describe "AccessControl routing", type: :routing do
  include Rails::Controller::Testing::TestProcess
  include Rails::Controller::Testing::TemplateAssertions
  include Rails::Controller::Testing::Integration

  # Test a login
  it "routes GET /login to the login#login action" do
    expect(get: '/login').to route_to(controller: 'access_control/login', action: 'login')
  end

  it "routes POST /login to the login#create action" do
    expect(post: '/login').to route_to(controller: 'access_control/login', action: 'create')
  end

  # Test a register
  it "routes GET /register to the register#register action" do
    expect(get: '/register').to route_to(controller: 'access_control/register', action: 'register')
  end

  it "routes POST /register to the register#create action" do
    expect(post: '/register').to route_to(controller: 'access_control/register', action: 'create')
  end

  # Test a logout
  it "routes DELETE /logout to the login#destroy action" do
    expect(delete: '/logout').to route_to(controller: 'access_control/login', action: 'destroy')
  end

end
