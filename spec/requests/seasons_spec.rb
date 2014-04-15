require 'spec_helper'

describe "Seasons" do
  describe "GET /seasons" do
    it "works! (now write some real specs)" do
      get seasons_path
      expect(response.status).to be(200)
    end
  end
end
