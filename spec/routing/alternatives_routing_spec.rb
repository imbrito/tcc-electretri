require "rails_helper"

RSpec.describe AlternativesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/projects/1/alternatives").to route_to("alternatives#index", :project_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/projects/1/alternatives/new").to route_to("alternatives#new", :project_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/projects/1/alternatives/1").to route_to("alternatives#show", :project_id => "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/projects/1/alternatives/1/edit").to route_to("alternatives#edit", :project_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/projects/1/alternatives").to route_to("alternatives#create", :project_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/projects/1/alternatives/1").to route_to("alternatives#update", :project_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/projects/1/alternatives/1").to route_to("alternatives#destroy", :project_id => "1", :id => "1")
    end

  end
end
