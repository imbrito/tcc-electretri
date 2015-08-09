require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    let(:user) { FactoryGirl.create(:user) }
    describe "user registration" do
      it "allows new users to register with an email address and password" do
        visit new_user_registration_path
        fill_in "Email",                 :with => user.email
        fill_in "Password",              :with => user.password, :match => :prefer_exact
        fill_in "Password confirmation", :with => user.password, :match => :prefer_exact
        click_button "Sign up"
      end
    end

    describe "user sign in" do
      it "allows users to sign in after they have registered" do
        visit new_user_session_path
        fill_in "Email",    :with => user.email
        fill_in "Password", :with => user.password
        click_button "Sign in"
      end
    end

    it "blocks unauthenticated access" do
      get :index
      expect(response).to have_http_status(302)
    end

    it "allows authenticated access" do
      sign_in(user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #team" do
    it "returns http success" do
      get :team
      expect(response).to have_http_status(:success)
    end
  end

end
