require "rails_helper"

RSpec.describe LendingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lendings").to route_to("lendings#index")
    end

    it "routes to #new" do
      expect(:get => "/lendings/new").to route_to("lendings#new")
    end

    it "routes to #show" do
      expect(:get => "/lendings/1").to route_to("lendings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lendings/1/edit").to route_to("lendings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lendings").to route_to("lendings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lendings/1").to route_to("lendings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lendings/1").to route_to("lendings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lendings/1").to route_to("lendings#destroy", :id => "1")
    end

  end
end
