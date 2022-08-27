class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user!
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { message: 'user not created' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:Name, :email, :password)
  end
end
