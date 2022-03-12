class HotelStaysController < ApplicationController
  before_action :set_hotel_stay, only: %i[show edit update destroy]

  def index
    @q = HotelStay.ransack(params[:q])
    @hotel_stays = @q.result(distinct: true).includes(:user,
                                                      :hotel).page(params[:page]).per(10)
  end

  def show; end

  def new
    @hotel_stay = HotelStay.new
  end

  def edit; end

  def create
    @hotel_stay = HotelStay.new(hotel_stay_params)

    if @hotel_stay.save
      message = "HotelStay was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @hotel_stay, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @hotel_stay.update(hotel_stay_params)
      redirect_to @hotel_stay, notice: "Hotel stay was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @hotel_stay.destroy
    message = "HotelStay was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to hotel_stays_url, notice: message
    end
  end

  private

  def set_hotel_stay
    @hotel_stay = HotelStay.find(params[:id])
  end

  def hotel_stay_params
    params.require(:hotel_stay).permit(:hotel_id, :user_id)
  end
end
