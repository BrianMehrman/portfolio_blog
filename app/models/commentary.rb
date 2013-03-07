class Commentary < ActiveRecord::Base
  attr_accessible :comment_id, :post_id

  belongs_to :post
  belongs_to :comment
  
end
