class CitiesController < ApplicationController
  before_action :set_city, only: %i[show edit update destroy]

  def index
    @q = City.ransack(params[:q])
    @cities = @q.result(distinct: true).includes(:activities,
                                                 :hotels).page(params[:page]).per(10)
  end

  def show
    @hotel = Hotel.new
    @activity = Activity.new
  end

  def new
    @city = City.new
  end

  def edit; end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to @city, notice: "City was successfully created."
    else
      render :new
    end
  end

  def update
    if @city.update(city_params)
      redirect_to @city, notice: "City was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_url, notice: "City was successfully destroyed."
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end
end
