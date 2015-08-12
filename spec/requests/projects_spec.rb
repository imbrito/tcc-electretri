require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  describe "GET /projects" do
    it "works!" do
      visit new_user_session_path
      fill_in "Email",    :with => user.email
      fill_in "Password", :with => user.password
      click_button "Sign in"
      redirect_to projects_path
    end
  end
end
