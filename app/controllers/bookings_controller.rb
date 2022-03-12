class BookingsController < ApplicationController
  before_action :current_user_must_be_booking_user,
                only: %i[edit update destroy]

  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @q = Booking.ransack(params[:q])
    @bookings = @q.result(distinct: true).includes(:user,
                                                   :flight).page(params[:page]).per(10)
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def edit; end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      message = "Booking was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @booking, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: "Booking was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    message = "Booking was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to bookings_url, notice: message
    end
  end

  private

  def current_user_must_be_booking_user
    set_booking
    unless current_user == @booking.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :flight_id)
  end
end
