require 'rails_helper'

describe "Users" do
  describe "GET /users" do
    let(:team) { FactoryGirl.create(:team) }

    it "works! (now write some real specs)" do
      get users_path(team_id: team.slug)
      expect(response.status).to be(200)
    end
  end
end
