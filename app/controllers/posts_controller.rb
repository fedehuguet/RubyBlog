class PostsController < ApplicationController

	def index
		@q = Post.ransack(params[:q])
		@posts = @q.result(distinct: true)
	end
	def new
		@post = Post.new
		@category = Category.all
	end	
	def create
   		@post = Post.new(post_params) 
        # if the category is saved successfully than respond with json data and status code 201
        if @post.save 
    		redirect_to posts_path, :notice => "Your post is saved"
  	 	else
    		render "new"
   		end
  	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params) 
    		redirect_to posts_path, :notice => "Your post is updated"
  	 	else
    		render "edit"
   		end
	end
	def show
		@post = Post.find(params[:id])
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path :notice => "Your post has been deleted"
	end

	private
  	def post_params
   		params.require(:post).permit(:title, :body, :category_id)
  	end
end
