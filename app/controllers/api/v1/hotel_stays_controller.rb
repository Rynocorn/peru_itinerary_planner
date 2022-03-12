class Api::V1::HotelStaysController < Api::V1::GraphitiController
  def index
    hotel_stays = HotelStayResource.all(params)
    respond_with(hotel_stays)
  end

  def show
    hotel_stay = HotelStayResource.find(params)
    respond_with(hotel_stay)
  end

  def create
    hotel_stay = HotelStayResource.build(params)

    if hotel_stay.save
      render jsonapi: hotel_stay, status: :created
    else
      render jsonapi_errors: hotel_stay
    end
  end

  def update
    hotel_stay = HotelStayResource.find(params)

    if hotel_stay.update_attributes
      render jsonapi: hotel_stay
    else
      render jsonapi_errors: hotel_stay
    end
  end

  def destroy
    hotel_stay = HotelStayResource.find(params)

    if hotel_stay.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: hotel_stay
    end
  end
end
