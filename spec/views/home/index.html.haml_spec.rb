require 'rails_helper'

RSpec.describe "home/index.html.haml", type: :view do
	let(:user) { FactoryGirl.create(:user) }
  let(:project) { Project.create(:name => "Hello World",
    :description => "Pink and Brian, to domains the World!", 
    :cut => 0.75, :user_id => user.id) }
  before(:each) do
    allow(controller).to receive(:current_user){ user }
    allow(view).to receive_messages(:will_paginate => nil)
    assign(:projects, [ project ])
  end
  it "visit home#index" do 
  	render
  	assert_select "h1", :text => "Electre TRI APP", :count => 1
    assert_select "p", :text => "Sistema Web de Apoio à Decisão Multicritério, Baseado no Algoritmo ELECTRE TRI", :count => 1
    assert_select "tr>td", :text => "Hello World", :count => 1
    assert_select "tr>td", :text => "Pink and Brian, to domains the World!", :count => 1
    assert_select "tr>td", :text => 0.75.to_s, :count => 1
    assert_select "a", :text => "Edit", :count => 1
    assert_select "a", :text => "Delete", :count => 1
  end
end
