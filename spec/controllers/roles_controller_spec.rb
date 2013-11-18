require 'spec_helper'

describe RolesController do

  before(:each) do
    @role = FactoryGirl.create(:role)
    @role_attributes = FactoryGirl.attributes_for(:role)

  end
  
  describe "#index" do
    before(:each) do
      get :index
    end

    it "assigns all roles to @roles" do
      expect(assigns(:roles)).to eq([@role])
    end

    it "renders index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "#show" do
    before(:each) do
      get :show, id: @role.id
    end

    it "assigns a role to @role" do 
      expect(assigns(:role)).to eq(@role)
    end

    it "renders show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "#new" do
    before(:each) do 
      get :new
    end

    it "assigns a new role to @role" do
      expect(assigns(:role)).to be_an_instance_of(Role)
    end

    it "renders new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    before(:each) do
      post :create, role: @role_attributes
    end
    it "creates a role" do
      expect(Role.last.name).to eq(@role_attributes[:name])
    end

    it "redirects to created role" do
      response.should redirect_to(Role.last)
    end
  end

  describe "#edit" do
    before(:each) do
      get :edit, id: @role.id
    end

    it "assigns requested role to @role" do
      expect(assigns(:role)).to eq(@role)
    end

    it "renders edit template" do
      expect(response).to render_template(:edit)
    end
  end 

  describe "#update" do
    before(:each) do 
      put :update, id:@role.id, role:@role_attributes
    end

    it "assigns updated role to @role" do
      expect(assigns(:role)).to eq(@role)
    end

    it "updates the requested role" do
      expect(assigns(:role).name).to eq(@role_attributes[:name])
    end

    it "redirects the user to the roles show page" do 
      expect(response).to redirect_to(@role)
    end
  end

  describe "#destroy" do
    it "destroys the requested role" do 
      expect {
        delete :destroy, id: @role.id
      }.to change(Role,:count).by(-1)
    end

    it "redirects to the roles list" do 
      delete :destroy, id: @role.id
      expect(response).to redirect_to(roles_path)
    end
  end
end
