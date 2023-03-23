class CommentsController < ApplicationController
    before_action authenticate_user!
    def create
        @post = Post.friendly.find(params[:id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        redirect_to post_path(@post)
      end
    
      private
        def comment_params
          params.require(:comment).permit(:comment, :user_id)
        end
end
