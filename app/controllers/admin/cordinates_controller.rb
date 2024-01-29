class Admin::CordinatesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @cordinates = Cordinate.page(params[:page])
  end

  def new
    @cordinate = Cordinate.new
  end

  def create
    #render plain: current_admin.id
    @cordinate = Cordinate.new(cordinate_params.merge(:admin_id=>current_admin.id))
    if @cordinate.save!
      redirect_to admin_path
    else
      render :new
    end
  end

  def show
    @cordinate = Cordinate.find(params[:id])
  end

  def edit
    @cordinate = Cordinate.find(params[:id])
  end

  def update
    @cordinate = Cordinate.find(params[:id])
    if @cordinate.update(cordinate_params)
      redirect_to admin_cordinate_path
    else
      render :edit
    end
  end
  def destroy
    @cordinate = Cordinate.find(params[:id])
    @cordinate.destroy
    redirect_to admin_users_path
  end

  def search
    if params[:name].present?
      @cordinates = Cordinate.where('name LIKE ?', "%#{params[:name]}%")
    else
      @cordinates = Cordinate.none
    end
  end

  private

  def cordinate_params
    params.require(:cordinate).permit(:introduction,:title, :image, :season_id, item_ids: [])
  end

end
