class Post < ActiveRecord::Base
	# attr_accessible :image, :title, :description, :content, :user_id, :html, :css, :javascript, :status_type_id

	mount_uploader :image, ImageUploader

	has_many :categorized_posts
	has_many :categories, :through => :categorized_posts
	has_many :commentaries
	has_many :comments, :through => :commentaries

	has_many :attachments

	belongs_to :user

	has_one :status_type

	# validations
  validates_presence_of :title, :description, :content

	class << self
		def by_category(category_name)
			joins(:categories).where(["name = ?", category_name])
		end
	end
end

