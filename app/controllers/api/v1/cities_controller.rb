class Api::V1::CitiesController < Api::V1::GraphitiController
  def index
    cities = CityResource.all(params)
    respond_with(cities)
  end

  def show
    city = CityResource.find(params)
    respond_with(city)
  end

  def create
    city = CityResource.build(params)

    if city.save
      render jsonapi: city, status: 201
    else
      render jsonapi_errors: city
    end
  end

  def update
    city = CityResource.find(params)

    if city.update_attributes
      render jsonapi: city
    else
      render jsonapi_errors: city
    end
  end

  def destroy
    city = CityResource.find(params)

    if city.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: city
    end
  end
end
