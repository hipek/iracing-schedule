require 'spec_helper'

describe UserSeasonsController do

  describe "GET 'index'" do
    let(:team) { FactoryGirl.create(:team) }

    it "returns http success" do
      get 'index', team_id: team.slug
      expect(response).to be_success
    end
  end

end
