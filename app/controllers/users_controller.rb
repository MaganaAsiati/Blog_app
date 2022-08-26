class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to new_user_session_path if current_user.nil?
    @users = User.order(:Name)
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.recent_posts
  end
end
