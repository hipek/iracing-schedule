require 'rails_helper'

describe "Teams" do
  describe "GET /teams" do
    it "works! (now write some real specs)" do
      get teams_path
      expect(response.status).to be(200)
    end
  end
end
