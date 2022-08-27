
# before_action :set_post, only: [:index, :show, :destroy]

class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts.includes(:author)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    puts 'Yes I can destroy'
    @post.destroy 
    redirect_to user_post_path(@user.id, @post.id)
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    @params = params
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_url(@user.id) }
      else
        format.html { render :new }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text, :author_id)
  end
end
