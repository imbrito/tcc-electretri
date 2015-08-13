require "rails_helper"

RSpec.describe HomeController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/index").to route_to("home#index")
    end

    it "routes to #about" do
      expect(:get => "/about").to route_to("home#about")
    end

    it "routes to #team" do
      expect(:get => "/team").to route_to("home#team")
    end
  end
end
