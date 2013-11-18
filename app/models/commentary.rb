class Commentary < ActiveRecord::Base
  attr_accessible :comment_id, :post_id

  belongs_to :post
  belongs_to :comment
  
  validates_presence_of :post_id, :comment_id
end
