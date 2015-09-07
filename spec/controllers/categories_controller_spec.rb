require 'spec_helper'

describe CategoriesController do

  let(:category){ FactoryGirl.create(:category) }

  describe "#index" do
    before(:each) do
      category
      get :index
    end

    it "assigns all attachments for post to @assignments" do
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe "#show" do
    before(:each) do
      get :show, id: category.id
    end

    it "has category" do
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "#new" do
    before(:each) do
      get :new
    end

    it "has category" do
      expect(assigns(:category)).to be_instance_of(Category)
    end

    it "goes to a new page" do
      expect(response).to render_template(:new)
    end
  end

  describe "#edit" do
    before(:each) do
      get :edit, id: category.id
    end

    it "has a category" do
      expect(assigns(:category)).to eq(category)
    end

    it "goes to the edit page" do
      expect(response).to render_template(:edit)
    end
  end

  describe "#create" do
    let(:category_attribute){ FactoryGirl.attributes_for(:category) }
    before(:each) do
      post :create, category: category_attribute.except(:created_at,:updated_at)
    end

    it "has a category" do
      expect(assigns(:category).name).to eq(category_attribute[:name])
    end

    it "goes to the show page" do
      expect(response).to redirect_to(assigns(:category))
    end
  end
end

