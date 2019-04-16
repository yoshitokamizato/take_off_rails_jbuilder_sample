class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer
  end

  def create
    User.create!(user_params)
  end

  def show
    @users = User.find(params[:id])
    render json: UserSerializer.new(@user)
  end

  def update
    @user.update!(user_params)
  end

  def destroy
    @user.destroy!
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:account, :name, :email)
    end

end
