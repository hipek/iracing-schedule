require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', team_id: 1
      expect(response).to be_success
    end
  end

end
