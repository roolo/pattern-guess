require "spec_helper"

describe PatternsController do
  describe "routing" do

    it "routes to #index" do
      get("/patterns").should route_to("patterns#index")
    end

    it "routes to #new" do
      get("/patterns/new").should route_to("patterns#new")
    end

    it "routes to #show" do
      get("/patterns/1").should route_to("patterns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/patterns/1/edit").should route_to("patterns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/patterns").should route_to("patterns#create")
    end

    it "routes to #update" do
      put("/patterns/1").should route_to("patterns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/patterns/1").should route_to("patterns#destroy", :id => "1")
    end

  end
end
