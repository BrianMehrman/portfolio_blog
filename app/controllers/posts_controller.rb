class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json


  layout 'facebox', :only => [:manage_selected_categories, :categorize_selected]
  def index
    @posts = params[:category].present? ? Post.by_category(params[:category]) : Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    # create a post with the status of draft
    @post = Post.find_or_create_by_user_id_and_status_type_id_and_title_and_description(session[:user_id],1,nil,nil)

    @post.html = "<p>Canvas pane goes here:</p>
      <canvas id='pane' width='300' height='200'></canvas>
      <script>
        var canvas = document.getElementById('pane');
        var context = canvas.getContext('2d');

        context.fillStyle = 'rgb(250,0,0)';
        context.fillRect(10, 10, 55, 50);

        context.fillStyle = 'rgba(0, 0, 250, 0.5)';
        context.fillRect(30, 30, 55, 50);
      </script>"
    @post.css = "/*
      The CSS Goes Here
      */
      p {font-family: monospace;}"
    @post.javascript = "// This is where you put the javascript"
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
    params[:post][:image] = parse_image(params[:post][:image])

    respond_to do |format|
      if @post.update_attributes(params[:post])
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
    params[:post][:image] = parse_image(params[:post][:image])

    respond_to do |format|
      if @post.update_attributes(params[:post])
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
    posts = Post.find params[:posts]
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

end
