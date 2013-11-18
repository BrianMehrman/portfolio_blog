require "spec_helper"

describe Post::AttachmentsController do
  describe 'routing' do
    it "routes to #index" do
      expect(get("/posts/1/attachments")).to route_to("attachments#index", post_id: "1")
    end

    it "routes to #new" do
      expect(get("/posts/1/attachments/new")).to route_to("attachments#new", post_id: "1")
    end

    it "routes to #show" do
      expect(get("/posts/1/attachments/1")).to route_to("attachments#show", post_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get("/posts/1/attachments/1/edit")).to route_to("attachments#edit", post_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post("/posts/1/attachments")).to route_to("attachments#create",post_id: "1")
    end

    it "routes to #update" do
      expect(put("/posts/1/attachments/1")).to route_to("attachments#update", post_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete("/posts/1/attachments/1")).to route_to("attachments#destroy", post_id: "1", id: "1")
    end

  end
end