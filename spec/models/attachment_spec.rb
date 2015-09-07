require 'spec_helper'

describe Attachment do
  # let(:attachment) {FactoryGirl.create :attachment}
  let(:user){ FactoryGirl.create(:user) }
  let(:html_attachment) {FactoryGirl.create :attachment, :with_html_snippet, user: user}
  let(:image_attachment) {FactoryGirl.create :attachment, :with_image, user: user}
  # let(:flash_attachment) {FactoryGirl.create :attachment, :with_flash}
  it { should respond_to :slug_name }

  it "should get attachable types" do
    expect(Attachment.get_attachable_types.size).to eq(2)
  end

  context "when attachable is html snippet" do
    it 'attachable is of class HtmlSnippet' do
      expect(html_attachment.attachable.class).to eq(HtmlSnippet)
    end

  end

  context "when attachble is media" do
    it "attachble is of class Medium" do
      expect(image_attachment.attachable.class).to eq(Medium)
    end

  end

end
