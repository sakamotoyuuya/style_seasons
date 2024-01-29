class Users::CordinatesController < ApplicationController
  def index
    if params[:season_id].present?
      #presentメソッドでparams[:season_id]に値が含まれているか確認 => trueの場合下記を実行
      @season = Season.find(params[:season_id])
      @cordinates = @season.cordinates.page(params[:page]).per(8)
    else
      @cordinates = Cordinate.page(params[:page]).per(8)
      @seasons = Season.all
    end
  end

  def show
    @cordinate = Cordinate.find(params[:id])
    @seasons = Season.all
    if params[:season_id].present?
      #presentメソッドでparams[:season_id]に値が含まれているか確認 => trueの場合下記を実行
      @season = Season.find(params[:season_id])
      @cordinates = @season.cordinates
    end
  end

  def search
    if params[:title].present?
      @cordinates = Cordinate.where('title LIKE ?', "%#{params[:title]}%")
    else
      @cordinates = Cordinate.none
    end
  end
end
