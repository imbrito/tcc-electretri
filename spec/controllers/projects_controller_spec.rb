require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ProjectsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.build(:project).attributes }

  let(:invalid_attributes) { nil }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:project) { FactoryGirl.create(:project) }
  
  describe "GET #index" do
    it "assigns all projects as @projects" do
      get :index, {}, valid_session
      expect(assigns(:projects)) == [project]
    end
  end

  describe "GET #show" do
    it "assigns the requested project as @project" do
      get :show, {:id => project.to_param}, valid_session
      expect(assigns(:project)) == project
    end
  end

  describe "GET #new" do
    it "assigns a new project as @project" do
      get :new, {}, valid_session
      expect(assigns(:project)) == project
    end
  end

  describe "GET #edit" do
    it "assigns the requested project as @project" do
      get :edit, {:id => project.to_param}, valid_session
      expect(assigns(:project)) == project
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, {:project => project}, valid_session
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, {:project => project}, valid_session
        expect(assigns(:project)) == project
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested project" do
        put :update, {:id => project.to_param, :project => project}, valid_session
        project.reload
        expect(assigns(:project)) == project
      end

      it "assigns the requested project as @project" do
        put :update, {:id => project.to_param, :project => project}, valid_session
        expect(assigns(:project)) == project
      end
    end

    context "with invalid params" do
      it "assigns the project as @project" do
        put :update, {:id => project.to_param, :project => invalid_attributes}, valid_session
        expect(assigns(:project)) == project
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create(:user) }
    let(:project) { Project.create(:name => "Hello World", :description => "Pink and Brian, to domains the World!", 
      :cut => 0.75, :user_id => user.id) }
    before(:each) do
      sign_in(user)
    end
    it "destroys the requested project" do
      expect {
        delete :destroy, {:id => project.to_param}, valid_session
      }.to change(Project, :count).by(0)
    end

    it "redirects to the projects list" do
      delete :destroy, {:id => project.to_param}, valid_session
      expect(response).to redirect_to(projects_url)
    end
  end

end