module Api
  module V1
    module Admin
      class BlogsController < BaseController
        # hence forth the Post shall know as the Blog.
        respond_to :json,:html
        def index
          @category = params[:category]
          @posts = @category.present? ? Post.by_category(@category) : Post.all
          respond_with(@posts)
        end

        def new

        end

        def edit
        end

        def create
          @blog = Post.new(post_params)

          respond_to do |format|
              if @blog.save
                format.html { redirect_to @blog, notice: 'Blog post was successfully created.' }
                format.json { render json: @blog, status: :created, location: @blog }
              else
                format.html { render action: "new" }
                format.json { render json: @blog.errors, status: :unprocessable_entity }
              end
            end
        end

        def update
        end

        def destroy
        end

        private

        def post_params
          params.require(:post).permit!
        end
      end
    end
  end
end
