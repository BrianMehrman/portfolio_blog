class AttachmentsController < ApplicationController
  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = Attachment.all

    @post = Post.find(params[:post_id]) if params[:post_id]

    respond_to do |format|
      # format.html # index.html.erb
      format.js { render :layout=>false }
      format.json { render json: @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
    @attachment = Attachment.find(params[:id])
    @post = Post.find(params[:post_id])

    respond_to do |format|
      # format.html # show.html.erb
      format.js {render :layout=>false}
      format.json { render json: @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.json
  def new
    @attachment = Attachment.new
    @post = (params[:post_id] == 0 ? Post.find(params[:post_id]) : Post.new)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attachment }
    end
  end

  # GET /attachments/1/edit
  def edit
    @post = Post.find(params[:post_id])

    @attachment = Attachment.find(params[:id])
    # TODO: add attachments edit form

  end

  # POST /attachments
  # POST /attachments.json
  def create
    @post = Post.find(params[:post_id])

    @attachment = Attachment.new(attachment_params)

    respond_to do |format|
      if @attachment.save
        # TODO: redirect to attachments edit page
        format.html { redirect_to edit_post_path(@post), notice: 'Attachment was successfully created.' }
        format.json { render json: @attachment, status: :created, location: @attachment }
      else
        format.html { render action: "new" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.json
  def update
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(attachment_params)
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to attachments_url }
      format.json { head :no_content }
    end
  end

  private

    def attachment_params
      params.require(:attachment).permit(:attachable_id, :attachable_type, :attacher_id, :post_id, :slug_name)
    end
end
