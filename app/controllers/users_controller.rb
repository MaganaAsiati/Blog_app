class UsersController < ApplicationController

  def index
      @users = User.order(:Name)
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.recent_posts
  end
end
