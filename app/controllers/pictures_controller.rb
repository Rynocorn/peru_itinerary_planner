class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]

  def index
    @q = Picture.ransack(params[:q])
    @pictures = @q.result(distinct: true).includes(:activity).page(params[:page]).per(10)
  end

  def show; end

  def new
    @picture = Picture.new
  end

  def edit; end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      message = "Picture was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @picture, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: "Picture was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    message = "Picture was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to pictures_url, notice: message
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:activity_id, :picture, :name)
  end
end
