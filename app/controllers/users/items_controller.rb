class Users::ItemsController < ApplicationController
  def index
  @cordinate = Cordinate.find(params[:id])
  end
end
