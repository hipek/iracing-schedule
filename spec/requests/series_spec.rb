require 'rails_helper'

describe "Series" do
  describe "GET /series" do
    it "works! (now write some real specs)" do
      get series_index_path
      expect(response.status).to be(200)
    end
  end
end
