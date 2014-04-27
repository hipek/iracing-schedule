require "spec_helper"

describe SeriesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/series").to route_to("series#index")
    end

    it "routes to #show" do
      expect(:get => "/series/1").to route_to("series#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/series/1/edit").to route_to("series#edit", :id => "1")
    end

    it "routes to #update" do
      expect(:put => "/series/1").to route_to("series#update", :id => "1")
    end
  end
end
