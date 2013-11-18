require 'spec_helper'

describe Post do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    @category = FactoryGirl.create(:category)
    @post.user = @user
    @post.categories << @category
    @post.save
    @post_attributes = FactoryGirl.attributes_for(:post)
  end
  
  context "is invalid " do
    [:title, :description, :content].each do |attr|
      it "when #{attr} is blank." do
        subject.valid?
        expect(subject.errors[attr]).to include "can't be blank"
      end
    end 
  end

  describe "#by_category" do
    it "returns posts for given category." do
      posts = Post.by_category(@category.name)
      expect(posts).to eq([@post])
    end
  end


end