class Admin::CordinatesController < ApplicationController

  def index
    @cordinates = Cordinate.page(params[:page])
  end

  def new
    @cordinate = Cordinate.new
  end

  def create
    @cordinate = Cordinate.new(cordinate_params)
    if @cordinate.save!
      redirect_to admin_cordinate_path(@cordinate)
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

  def search
    if params[:name].present?
      @cordinates = Cordinate.where('name LIKE ?', "%#{params[:name]}%")
    else
      @cordinates = Cordinate.none
    end
  end
end
