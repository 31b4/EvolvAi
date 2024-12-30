# spec/routing/access_control_routing_spec.rb
require 'rails_helper'

RSpec.describe "AccessControl routing", type: :routing do
  include Rails::Controller::Testing::TestProcess
  include Rails::Controller::Testing::TemplateAssertions
  include Rails::Controller::Testing::Integration

  # Teszteljük a login útvonalakat
  it "routes GET /login to the login#login action" do
    expect(get: '/login').to route_to(controller: 'access_control/login', action: 'login')
  end

  it "routes POST /login to the login#create action" do
    expect(post: '/login').to route_to(controller: 'access_control/login', action: 'create')
  end

  # Teszteljük a register útvonalakat
  it "routes GET /register to the register#register action" do
    expect(get: '/register').to route_to(controller: 'access_control/register', action: 'register')
  end

  it "routes POST /register to the register#create action" do
    expect(post: '/register').to route_to(controller: 'access_control/register', action: 'create')
  end

  # Teszteljük a logout útvonalat
  it "routes DELETE /logout to the login#destroy action" do
    expect(delete: '/logout').to route_to(controller: 'access_control/login', action: 'destroy')
  end

  # Teszteljük a redirect útvonalakat
  # it "routes GET /access_control/login to a redirect" do
  #   expect(get: '/access_control/login').to route_to(redirect('/login'))
  # end
  #
  # it "routes GET /access_control/register to a redirect" do
  #   expect(get: '/access_control/register').to route_to(redirect('/register'))
  # end
end
