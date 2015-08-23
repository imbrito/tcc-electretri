require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { Project.create(:name => "Hello World",
    :description => "Pink and Brian, to domains the World!", 
    :cut => 0.75, :user_id => user.id) }
  before(:each) do
    allow(controller).to receive(:current_user){ user }
    assign(:projects, [ project ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Hello World", :count => 1
    assert_select "tr>td", :text => "Pink and Brian, to domains the World!", :count => 1
    assert_select "tr>td", :text => 0.75.to_s, :count => 1
  end
end
