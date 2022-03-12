class ActivitySignupsController < ApplicationController
  before_action :set_activity_signup, only: %i[show edit update destroy]

  # GET /activity_signups
  def index
    @q = ActivitySignup.ransack(params[:q])
    @activity_signups = @q.result(distinct: true).includes(:user,
                                                           :activity).page(params[:page]).per(10)
  end

  # GET /activity_signups/1
  def show; end

  # GET /activity_signups/new
  def new
    @activity_signup = ActivitySignup.new
  end

  # GET /activity_signups/1/edit
  def edit; end

  # POST /activity_signups
  def create
    @activity_signup = ActivitySignup.new(activity_signup_params)

    if @activity_signup.save
      message = "ActivitySignup was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @activity_signup, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /activity_signups/1
  def update
    if @activity_signup.update(activity_signup_params)
      redirect_to @activity_signup,
                  notice: "Activity signup was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /activity_signups/1
  def destroy
    @activity_signup.destroy
    message = "ActivitySignup was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to activity_signups_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activity_signup
    @activity_signup = ActivitySignup.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def activity_signup_params
    params.require(:activity_signup).permit(:user_id, :activity_id)
  end
end
