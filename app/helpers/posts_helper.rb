module PostsHelper
	def recent_blogs
		Post.by_category("blog")
	end

	def recent_experiments
		Post.by_category("experiment")
	end
end
