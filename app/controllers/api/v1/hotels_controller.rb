class Api::V1::HotelsController < Api::V1::GraphitiController
  def index
    hotels = HotelResource.all(params)
    respond_with(hotels)
  end

  def show
    hotel = HotelResource.find(params)
    respond_with(hotel)
  end

  def create
    hotel = HotelResource.build(params)

    if hotel.save
      render jsonapi: hotel, status: 201
    else
      render jsonapi_errors: hotel
    end
  end

  def update
    hotel = HotelResource.find(params)

    if hotel.update_attributes
      render jsonapi: hotel
    else
      render jsonapi_errors: hotel
    end
  end

  def destroy
    hotel = HotelResource.find(params)

    if hotel.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: hotel
    end
  end
end
