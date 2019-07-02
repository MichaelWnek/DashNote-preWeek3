class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    authorize @comment

    @comment.save

    @new_comment = Comment.new

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment

    @comment.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(author: current_user)
  end
end
