require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:proj, FactoryGirl.create(:project))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "textarea#project_description[name=?]", "project[description]"

      assert_select "select#project_cut[name=?]", "project[cut]"

    end
  end
end