class Api::V1::CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comment = Comment.where({ post_id: params[:post_id] })
    render json: @comment, status: :ok
  end

  def new
    @user = User.find(params[:user_id])
    @comment = Comment.where({ post_id: params[:post_id] })
    render json: @comment, status: :ok
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(post_id: @post.id, text: comment_params)
    @comment.post_id = @post.id
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { messages: 'error' }, status: :error
    end
  end

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
