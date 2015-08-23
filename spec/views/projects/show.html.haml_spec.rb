require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, Project.create(:name => "Hello World",
    :description => "Pink and Brian, to domains the World!", :cut => 0.75))
  end

  it "renders attributes in #show" do
    render
    assert_select "h1", :text => "Project", :count => 1
    assert_select "p>strong", :text => "Name", :count => 1
    assert_select "p", :text => "Name\n\nHello World", :count => 1
    assert_select "p>strong", :text => "Description", :count => 1
    assert_select "p", :text => "Description\n\nPink and Brian, to domains the World!", :count => 1
    assert_select "p>strong", :text => "Cut:", :count => 1
    assert_select "p", :text => "Cut:\n0.75", :count => 1
    assert_select "a", :text => "Back", :count => 1
    assert_select "a", :text => "Edit", :count => 1
    assert_select "a", :text => "Delete", :count => 1
  end
end
