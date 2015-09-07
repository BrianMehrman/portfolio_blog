class CategorizedPost < ActiveRecord::Base
  # attr_accessible :category_id, :post_id

  belongs_to :category
  belongs_to :post

  validates_presence_of :category_id, :post_id
end
