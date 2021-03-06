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

RSpec.describe AlternativesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Alternative. As you add validations to Alternative, be sure to
  # adjust the attributes here as well.
  let(:user) { FactoryGirl.create(:user) }

  let(:project) do
    Project.create(name: 'Hello World', description: 'Pink and Brian, to domains the World!',
                   cut: 0.75, user_id: user.id)
  end

  let(:alternative) do
    Alternative.create(name: 'Alternative A', description: 'This first alternative!',
                       project_id: project.id)
  end

  let(:performable) do
    Alternative.create(name: 'Alternative A', description: 'This first alternative!',
                       project_id: project.id)
  end

  let(:valid_attributes) { FactoryGirl.build(:alternative).attributes }
  let(:invalid_attributes) { FactoryGirl.build(:invalid_alternative).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AlternativesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) { sign_in(user) }

  describe 'GET #show' do
    it 'assigns the requested alternative as @alternative' do
      get :show, { project_id: project.to_param, id: performable.to_param }, valid_session
      expect(assigns(:performable)).to eq(performable)
    end
  end

  describe 'GET #new' do
    it 'assigns a new alternative as @alternative' do
      get :new, { project_id: project.to_param }, valid_session
      expect(assigns(:alternative)).to be_a_new(Alternative)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested alternative as @alternative' do
      get :edit, { project_id: project.to_param, id: alternative.to_param }, valid_session
      expect(assigns(:alternative)).to eq(alternative)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Alternative' do
        expect do
          post :create, { project_id: project.to_param, alternative: valid_attributes }, valid_session
        end.to change(Alternative, :count).by(1)
      end

      it 'assigns a newly created alternative as @alternative' do
        post :create, { project_id: project.to_param, alternative: valid_attributes }, valid_session
        expect(Alternative.last.name).to eq(alternative.name)
        expect(Alternative.last.description).to eq(alternative.description)
      end

      it 'redirects to the created @alternative' do
        post :create, { project_id: project.to_param, alternative: valid_attributes }, valid_session
        expect(response).to redirect_to(project_path(project))
      end
    end

    context 'with invalid attributes' do
      it 'assigns a newly created but unsaved alternative as @alternative' do
        post :create, { project_id: project.to_param, alternative: invalid_attributes }, valid_session
        expect(assigns(:alternative)).to be_a_new(Alternative)
      end

      it "re-renders the 'new' template" do
        post :create, { project_id: project.to_param, alternative: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested alternative' do
        put :update, { project_id: project.to_param, id: alternative.to_param, alternative: valid_attributes }, valid_session
        alternative.reload
        expect(assigns(:alternative)).to eq(alternative)
      end

      it 'assigns the requested alternative as @alternative' do
        put :update, { project_id: project.to_param, id: alternative.to_param, alternative: valid_attributes }, valid_session
        expect(assigns(:alternative)).to eq(alternative)
      end

      it 'redirects to the updated @alternative' do
        put :update, { project_id: project.to_param, id: alternative.to_param, alternative: valid_attributes }, valid_session
        expect(response).to redirect_to(project_path(project))
      end
    end

    context 'with invalid params' do
      it 'assigns the alternative as @alternative' do
        put :update, { project_id: project.to_param, id: alternative.to_param, alternative: invalid_attributes }, valid_session
        expect(assigns(:alternative)).to eq(alternative)
      end

      it "re-renders the 'edit' template" do
        put :update, { project_id: project.to_param, id: alternative.to_param, alternative: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested alternative' do
      expect do
        delete :destroy, { project_id: project.to_param, id: alternative.to_param }, valid_session
      end.to change(Alternative, :count).by(0)
    end

    it 'redirects to the @project' do
      delete :destroy, { project_id: project.to_param, id: alternative.to_param }, valid_session
      expect(response).to redirect_to(Project.last)
    end
  end
end
