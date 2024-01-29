class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!

  def index
    @users = User.all.where(is_active: true).page(params[:page])
    # @user = User.find(params[:id])
  end

  def unsubscribe
    #byebug
    @user = User.find(params[:id])
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :is_active)
  end

end
