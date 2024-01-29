class Admin::SeasonsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @season = Season.new
    @seasons = Season.all
  end

  def create
    @season = Season.new(season_params)
    @seasons = Season.all
    if @season.save
      redirect_to admin_seasons_path
    else
      render :index
    end
  end

  def update
    @season = Season.find(params[:id])
    if @season.update(season_params)
      redirect_to admin_seasons_path
    else
      render :edit
    end
  end

  private
  def season_params
    params.require(:season).permit(:name)
  end
end
