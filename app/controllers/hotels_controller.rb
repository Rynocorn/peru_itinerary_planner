class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /hotels
  def index
    @q = Hotel.ransack(params[:q])
    @hotels = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)
  end

  # GET /hotels/1
  def show
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels
  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      message = 'Hotel was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @hotel, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /hotels/1
  def update
    if @hotel.update(hotel_params)
      redirect_to @hotel, notice: 'Hotel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hotels/1
  def destroy
    @hotel.destroy
    message = "Hotel was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to hotels_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hotel_params
      params.require(:hotel).permit(:name, :location, :user_id)
    end
end
