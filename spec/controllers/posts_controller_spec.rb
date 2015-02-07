require 'spec_helper'

describe PostsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    @post.user = @user
    @post.save
    @post_attributes = FactoryGirl.attributes_for(:post)

  end

  describe "#index" do
    before(:each) do
      get :index
    end

    it "assigns all posts to @posts" do
      expect(assigns(:posts)).to eq([@post])
    end

    it "renders index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "#show" do
    before(:each) do
      get :show, id: @post.id
    end

    it "assigns a post to @post" do
      expect(assigns(:post)).to eq(@post)
    end

    it "renders show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "#new" do
    before(:each) do
      get :new
    end

    it "assigns a new post to @post" do
      expect(assigns(:post)).to be_an_instance_of(Post)
    end
    it "creates a new post" do
    end
    it "new post has status of 'draft'" do
    end
    it "renders new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do

    before(:each) do
      img_str = File.open('spec/assets/images/text_uri_image.txt').read
      post_params = {
        id: @post.id,
        image: img_str
      }.merge(@post_attributes.except("created_at","updated_at","image_file_name",
                                      "image_content_type","image_file_size",
                                      "image_updated_at","status_type_id"))
      post :create, post: post_params
    end
    it "creates a post" do
      expect(assigns(:post).title).to eq(@post_attributes[:title])
    end

    it "redirects to created post" do
      response.should redirect_to(Post.last)
    end

    it "has only one post" do
      expect(Post.all.size).to eq(1)
    end
  end

  describe "#edit" do
    before(:each) do
      get :edit, id: @post.id
    end

    it "assigns requested post to @post" do
      expect(assigns(:post)).to eq(@post)
    end

    it "renders edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    before(:each) do
      # create dummy image string
      img_str = File.open('spec/assets/images/text_uri_image.txt').read
      @post_attributes[:image]= img_str
      put :update, id:@post.id, post:@post_attributes
    end

    it "assigns updated post to @post" do
      expect(assigns(:post)).to eq(@post)
    end

    it "updates the requested post" do
      expect(assigns(:post).title).to eq(@post_attributes[:title])
    end

    it "redirects the user to the posts show page" do
      expect(response).to redirect_to(@post)
    end
  end

  describe "#destroy" do
    it "destroys the requested post" do
      expect {
        delete :destroy, id: @post.id
      }.to change(Post,:count).by(-1)
    end

    it "redirects to the posts list" do
      delete :destroy, id: @post.id
      expect(response).to redirect_to(posts_path)
    end
  end
end
