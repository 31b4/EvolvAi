class HomeController < ApplicationController
  before_action :require_login

  def index
    render plain: "Hello, world!"
  end
end
