require "spec_helper"

describe AttachmentsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @html_attachment = FactoryGirl.create :attachment, :with_html_snippet, user: @user
    @post = FactoryGirl.create(:post)
    @post.attachments << @html_attachment
    @post.user = @user
    @post.save
    @post_attributes = FactoryGirl.attributes_for(:post)
  end

  describe "#index" do
    before(:each) do
      get :index, post_id: @post.id, format: :json
    end

    it "assigns all attachments for post to @assignments" do
      expect(assigns(:attachments)).to eq([@html_attachment])
    end
  end

  describe "#show" do
    before(:each) do
      get :show, id: @html_attachment.id, post_id: @post.id, format: :json
    end

    it "assigns an attachment to @attachment" do
      expect(assigns(:attachment)).to eq(@html_attachment)
    end
  end

  describe "#new" do
    before(:each) do
      @attachment = Attachment.new
      get :new, post_id: @post.id
    end

    it "assigns an attachment to @attachment" do
      expect(assigns(:attachment).id).to eq(nil)
    end

    it "should have a new attachment as @attachment" do
      expect(assigns(:attachment).new_record?).to eq(true)
    end
  end

  describe "#edit" do
    context "for an html attachment" do
      before(:each) do
        get :edit, id: @html_attachment.id, post_id: @post.id
      end

      it "assigns an attachment to @attachment" do
        expect(assigns(:attachment).id).to eq(@html_attachment.id)
      end

      it "assigns a post to @post" do
        expect(assigns(:post).id).to eq(@post.id)
      end
    end
  end

  describe "#create" do
    let(:html_attachment_params) { FactoryGirl.attributes_for :attachment, :with_html_snippet }
    context "for an html attachment" do
      before(:each) do
        post :create, attachment: html_attachment_params.except(:created_at,:updated_at), post_id: @post.id
      end

      it "has a post" do
        expect(assigns(:post)).to be_instance_of(Post)
      end
      it "has an attachment" do
        expect(assigns(:attachment)).to be_instance_of(Attachment)
      end


    end
  end
end
