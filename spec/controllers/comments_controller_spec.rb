require 'spec_helper'

describe CommentsController do
  let(:user){FactoryGirl.create(:user)}
  let(:apost){ FactoryGirl.create(:post,user:user)}
  let(:comment){ FactoryGirl.create(:comment)}
  before(:each) do
    apost.comments << comment
  end

  describe "#index" do
    before(:each) do
      get :index
    end
    it "has comments for a post" do
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "#show" do
    before(:each) do
      get :show, id: comment.id
    end
    it "has a comment" do
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "#new" do
    before(:each) do
      get :new
    end
    it "has a comment" do
      expect(assigns(:comment)).to be_instance_of(Comment)
    end
    it "has no contents" do
      expect(assigns(:comment).content).to eq(nil)
    end
  end

  describe "#edit" do
    before(:each) do
      get :edit, id: comment.id
    end

    it "has a comment" do
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "#create" do
    let(:comment_params){ FactoryGirl.attributes_for(:comment)}

    it "has added a comment" do
      expect{
        post :create, comment: comment_params.except(:created_at, :updated_at)
      }.to change(Comment, :count).by(1)
    end
  end
end
