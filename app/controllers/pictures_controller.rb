class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]

  # GET /pictures
  def index
    @q = Picture.ransack(params[:q])
    @pictures = @q.result(distinct: true).includes(:activity).page(params[:page]).per(10)
  end

  # GET /pictures/1
  def show; end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit; end

  # POST /pictures
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

  # PATCH/PUT /pictures/1
  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: "Picture was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /pictures/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_picture
    @picture = Picture.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def picture_params
    params.require(:picture).permit(:activity_id, :picture, :name)
  end
end
