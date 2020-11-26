class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
    # check admin permission before continuing
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(permit_user_params)
      redirect_to users_path
    else
      render :edit
    end
  end


  private

  def permit_user_params
    params.require(:user).permit(:email, :name, :address, :avatar, :phone_number)
  end
end