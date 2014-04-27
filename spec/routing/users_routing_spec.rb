require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/team1/users").to route_to("users#index", :team_id => 'team1')
    end

    it "routes to #new" do
      expect(:get => "/team1/users/new").to route_to("users#new", :team_id => 'team1')
    end

    it "routes to #show" do
      expect(:get => "/team1/users/1").to route_to("users#show", :id => "1", :team_id => 'team1')
    end

    it "routes to #edit" do
      expect(:get => "/team1/users/1/edit").to route_to("users#edit", :id => "1", :team_id => 'team1')
    end

    it "routes to #create" do
      expect(:post => "/team1/users").to route_to("users#create", :team_id => 'team1')
    end

    it "routes to #update" do
      expect(:put => "/team1/users/1").to route_to("users#update", :id => "1", :team_id => 'team1')
    end

    it "routes to #destroy" do
      expect(:delete => "/team1/users/1").to route_to("users#destroy", :id => "1", :team_id => 'team1')
    end

  end
end
