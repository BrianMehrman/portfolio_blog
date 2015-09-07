require "spec_helper"

describe HtmlSnippetsController do

  let(:htmlsnippet){FactoryGirl.create(:html_snippet)}

  describe "#index" do
    before(:each) do
      htmlsnippet
      get :index
    end

    it "has htmlsnippets" do
      expect(assigns(:html_snippets)).to eq([htmlsnippet])
    end
  end

  describe "#new" do
    before(:each) do
      get :new
    end

    it "has an htmlsnippet" do
      expect(assigns(:html_snippet)).to be_instance_of(HtmlSnippet)
    end
  end

  describe "#create" do
    let(:html_snippet_params){FactoryGirl.attributes_for(:html_snippet)}
    before(:each) do
      post :create, html_snippet: html_snippet_params.except(:created_at,:updated_at)
    end

    it "has an htmlsnippet" do
      expect(assigns(:html_snippet).name).to eq(html_snippet_params[:name])
    end
  end

  describe "#show" do

  end
end
