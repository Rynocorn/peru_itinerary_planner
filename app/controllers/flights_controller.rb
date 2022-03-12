class FlightsController < ApplicationController
  before_action :set_flight, only: %i[show edit update destroy]

  def index
    @q = Flight.ransack(params[:q])
    @flights = @q.result(distinct: true).includes(:bookings).page(params[:page]).per(10)
  end

  def show
    @booking = Booking.new
  end

  def new
    @flight = Flight.new
  end

  def edit; end

  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      redirect_to @flight, notice: "Flight was successfully created."
    else
      render :new
    end
  end

  def update
    if @flight.update(flight_params)
      redirect_to @flight, notice: "Flight was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @flight.destroy
    redirect_to flights_url, notice: "Flight was successfully destroyed."
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:origin, :destination, :date)
  end
end
