require "rails_helper"

RSpec.describe ProfilesController, type: :routing do
  describe "routing" do
    
    it "routes to #new" do
      expect(:get => "/projects/1/profiles/new").to route_to("profiles#new", :project_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/projects/1/profiles/1").to route_to("profiles#show", :project_id => "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/projects/1/profiles/1/edit").to route_to("profiles#edit", :project_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/projects/1/profiles").to route_to("profiles#create", :project_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/projects/1/profiles/1").to route_to("profiles#update", :project_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/projects/1/profiles/1").to route_to("profiles#destroy", :project_id => "1", :id => "1")
    end

  end
end
