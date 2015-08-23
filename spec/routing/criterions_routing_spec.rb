require "rails_helper"

RSpec.describe CriterionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/projects/1/criterions").to route_to("criterions#index", :project_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/projects/1/criterions/new").to route_to("criterions#new", :project_id => "1")
    end

    #it "routes to #show" do
    #  expect(:get => "/projects/1/criterions/1").to route_to("criterions#show", :project_id => "1", :id => "1")
    #end

    it "routes to #edit" do
      expect(:get => "/projects/1/criterions/1/edit").to route_to("criterions#edit", :project_id => "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/projects/1/criterions").to route_to("criterions#create", :project_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/projects/1/criterions/1").to route_to("criterions#update", :project_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/projects/1/criterions/1").to route_to("criterions#destroy", :project_id => "1", :id => "1")
    end

  end
end
