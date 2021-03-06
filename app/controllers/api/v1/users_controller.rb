class Api::V1::UsersController < ApplicationController
before_action :find_user, only: [:update, :show, :destroy]
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user
    render json: @user
  end

  def create
  
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_message }, status: :unprocessible_entity
    end
  end

  def update
    @user.udate(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_message }, status: :unprocessible_entity
    end
  end

  def destroy
    @users = Users.all
    @user.destroy
    # flash[:success] = "User deleted"
    render json: @users
  end

  def user_trips
    @user = User.find(params[:id])
    render json: @user.trips
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password_digest, :password, :username)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
