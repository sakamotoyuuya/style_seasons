class Users::LikesController < ApplicationController
    before_action :authenticate_user!
  def create
    @cordinate = Cordinate.find(params[:cordinate_id])
    like = current_user.likes.new(cordinate_id: @cordinate.id)
    like.save
  end

  def destroy
    @cordinate = Cordinate.find(params[:cordinate_id])
    like = current_user.likes.find_by(cordinate_id: @cordinate.id)
    like.destroy
  end
end
