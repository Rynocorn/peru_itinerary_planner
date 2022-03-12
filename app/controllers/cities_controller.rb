class CitiesController < ApplicationController
  before_action :set_city, only: %i[show edit update destroy]

  # GET /cities
  def index
    @q = City.ransack(params[:q])
    @cities = @q.result(distinct: true).includes(:activities).page(params[:page]).per(10)
  end

  # GET /cities/1
  def show
    @activity = Activity.new
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit; end

  # POST /cities
  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to @city, notice: "City was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /cities/1
  def update
    if @city.update(city_params)
      redirect_to @city, notice: "City was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
    redirect_to cities_url, notice: "City was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_city
    @city = City.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def city_params
    params.require(:city).permit(:name)
  end
end
