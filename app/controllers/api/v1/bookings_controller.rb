class Api::V1::BookingsController < Api::V1::GraphitiController
  def index
    bookings = BookingResource.all(params)
    respond_with(bookings)
  end

  def show
    booking = BookingResource.find(params)
    respond_with(booking)
  end

  def create
    booking = BookingResource.build(params)

    if booking.save
      render jsonapi: booking, status: :created
    else
      render jsonapi_errors: booking
    end
  end

  def update
    booking = BookingResource.find(params)

    if booking.update_attributes
      render jsonapi: booking
    else
      render jsonapi_errors: booking
    end
  end

  def destroy
    booking = BookingResource.find(params)

    if booking.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: booking
    end
  end
end
