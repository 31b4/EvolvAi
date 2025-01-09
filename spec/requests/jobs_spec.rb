require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  describe "GET /search" do
    it "returns http success" do
      get "/jobs/search"
      expect(response).to have_http_status(:success)
    end
  end

end
