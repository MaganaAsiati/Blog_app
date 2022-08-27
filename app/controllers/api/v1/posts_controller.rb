class Api::V1::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
    render json: @post, status: :ok
  end

  def show
    @post = Post.find(params[:id])
    render json: @post, status: :ok
  end
end
