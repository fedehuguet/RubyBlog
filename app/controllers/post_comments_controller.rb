class PostCommentsController < InheritedResources::Base

def create
	@post_comment = PostComment.new(post_comment_params) 
    @post_comment.save 
    redirect_to(@post_comment.post)
end

  private

    def post_comment_params
      params.require(:post_comment).permit(:name, :email, :body, :post_id)
    end
end

