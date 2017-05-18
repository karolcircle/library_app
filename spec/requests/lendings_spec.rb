require 'rails_helper'

RSpec.describe "Lendings", type: :request do
  describe "GET /lendings" do
    it "works! (now write some real specs)" do
      get lendings_path
      expect(response).to have_http_status(200)
    end
  end
end
