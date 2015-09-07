class PostsController < ApplicationController

  layout 'facebox', :only => [:manage_selected_categories, :categorize_selected]
  def index
    @category = params[:category]
    @posts = @category.present? ? Post.by_category(@category) : Post.all
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def new
    # create a post with the status of draft
    @post = Post.new(user_id: session[:user_id],status_type_id:1,title:nil,description:nil)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    # create post preview
    # params[:post][:image] = file

    @post = Post.find(params[:post][:id])
    post_params[:image] = parse_image(post_params[:image])

    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /posts/1
  # PUT /posts/1.json
  def update
    require 'CanvasToImage'
    @post = Post.find(params[:id])
    post_params[:image] = parse_image(post_params[:image])

    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

    # clean up file
    # file.close
    # file.unlink
  end

  def manage_selected_categories
    @categories = Category.all
    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  def categorize_selected
    posts = Post.find post_params
    categories = Category.find params[:categories]
    posts.each do |post|
      post.categories = categories
      unless post.save
        # catch error here
      end
    end

    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end


  private

  def parse_image(image_data)
    require 'CanvasToImage'

    File.open("tmp/reply.png", "wb") { |f| f.write(CanvasToImage::decode_data_uri(image_data)[0]) }

    File.open("tmp/reply.png", "r")
  end

  def post_params
    params.require(:post).permit!
  end

end
