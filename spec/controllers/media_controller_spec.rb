require 'spec_helper'

describe MediaController do

  let(:medium){FactoryGirl.create(:medium)}
  describe "#index" do
    before(:each) do
      medium
      get :index
    end

    it "has media" do
      expect(assigns(:media)).to eq([medium])
    end
  end

  describe "#show" do
    before(:each) do
      medium
      get :show, id: medium.id
    end

    it "has a medium" do
      expect(assigns(:medium)).to eq(medium)
    end
  end

  describe "#new" do
    before(:each) do
      get :new
    end

    it "has a medium" do
      expect(assigns(:medium)).to be_instance_of(Medium)
    end
  end

  describe "#edit" do
    before(:each) do
      medium
      get :edit, id: medium.id
    end

    it "has a medium" do
      expect(assigns(:medium)).to eq(medium)
    end
  end

  describe "#create" do
    before(:each) do
      @medium_params = FactoryGirl.attributes_for(:medium)
    end

    it "adds a medium or it gets the hose" do
      expect{
        post :create, medium: @medium_params.except(:created_at, :updated_at)
      }.to change(Medium, :count).by(1)
    end
  end

end
