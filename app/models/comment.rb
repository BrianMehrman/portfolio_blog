class Comment < ActiveRecord::Base
  # attr_accessible :content, :guest_name

  has_one :categorized_post
  has_one :post, :through => :categorized_post

  validates_presence_of :guest_name, :content
end
