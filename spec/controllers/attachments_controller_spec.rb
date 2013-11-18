require 'spec_helper'

describe AttachmentsController do
  let(:html_attachment) {FactoryGirl.create :attachment, :with_html_snippet}

  before(:each) do
    @user = FactoryGirl.create(:user)
    @html_attachment = html_attachment
    @post = FactoryGirl.create(:post)
    @post.attachments << @html_attachment
    @post.user = @user
    @post.save
    @post_attributes = FactoryGirl.attributes_for(:post)
  end

  describe "#index" do
    before(:each) do
      get :index, post_id: @post.id
    end

    it "assigns all attachments for post to @assignments" do
      expect(assigns(:attachments)).to eq([@html_attachment])
    end


  end

  describe "#show" do
    before(:each) do
      get :show, id: @html_attachment.id, post_id: @post.id
    end

    it 'assigns an attachment to @attachment' do
      expect(assigns(:attachment)).to eq(@html_attachment)
    end
  end

  describe '#new' do
    before(:each) do
      @attachment = Attachment.new
      get :new, post_id: @post.id
    end

    it 'assigns an attachment to @attachment' do
      expect(assigns(:attachment).id).to eq(nil)
    end

    it 'should have a new attachment as @attachment' do
      expect(assigns(:attachment).new_record?).to eq(true)
    end
  end

end
