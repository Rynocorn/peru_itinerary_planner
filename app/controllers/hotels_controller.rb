class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[show edit update destroy]

  def index
    @q = Hotel.ransack(params[:q])
    @hotels = @q.result(distinct: true).includes(:hotel_stays,
                                                 :city).page(params[:page]).per(10)
  end

  def show
    @hotel_stay = HotelStay.new
  end

  def new
    @hotel = Hotel.new
  end

  def edit; end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      message = "Hotel was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @hotel, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @hotel.update(hotel_params)
      redirect_to @hotel, notice: "Hotel was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @hotel.destroy
    message = "Hotel was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to hotels_url, notice: message
    end
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :city_id, :user_id)
  end
end
