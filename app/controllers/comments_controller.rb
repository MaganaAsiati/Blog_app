class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:post_id])
    @user_post = User.find(params[:user_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@user_post.id, @post.id)
  end

  def create
    @comment = current_user.comments.new(comment_params)
    redirect_to user_posts_path(@comment.post_id, @comment.author_id) if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author_id, :post_id)
  end
end
