class Api::V1::PicturesController < Api::V1::GraphitiController
  def index
    pictures = PictureResource.all(params)
    respond_with(pictures)
  end

  def show
    picture = PictureResource.find(params)
    respond_with(picture)
  end

  def create
    picture = PictureResource.build(params)

    if picture.save
      render jsonapi: picture, status: 201
    else
      render jsonapi_errors: picture
    end
  end

  def update
    picture = PictureResource.find(params)

    if picture.update_attributes
      render jsonapi: picture
    else
      render jsonapi_errors: picture
    end
  end

  def destroy
    picture = PictureResource.find(params)

    if picture.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: picture
    end
  end
end
