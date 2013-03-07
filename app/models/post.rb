class Post < ActiveRecord::Base
	attr_accessible :image, :title, :description, :content, :user_id, :html, :css, :javascript

	has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100" }

	has_many :categorized_posts
	has_many :categories, :through => :categorized_posts
	has_many :commentaries
	has_many :comments, :through => :commentaries

	belongs_to :user
	
	class << self
		def by_category(category_name)
			joins(:categories).where(["name = ?", category_name])
		end
	end
end

