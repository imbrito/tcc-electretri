require 'rails_helper'

RSpec.describe "home/index.html.haml", type: :view do
  it "visit home#index" do 
  	render
  	assert_select "h1", :text => "Electre TRI APP", :count => 1
    assert_select "p", :text => "Sistema Web de Apoio à Decisão Multicritério, Baseado no Algoritmo ELECTRE TRI", :count => 1
  	assert_select "a", :text => "Create a new Project", :count => 1
  end
end
