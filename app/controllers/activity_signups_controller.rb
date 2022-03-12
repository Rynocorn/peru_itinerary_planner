class ActivitySignupsController < ApplicationController
  before_action :set_activity_signup, only: [:show, :edit, :update, :destroy]

  # GET /activity_signups
  def index
    @activity_signups = ActivitySignup.all
  end

  # GET /activity_signups/1
  def show
  end

  # GET /activity_signups/new
  def new
    @activity_signup = ActivitySignup.new
  end

  # GET /activity_signups/1/edit
  def edit
  end

  # POST /activity_signups
  def create
    @activity_signup = ActivitySignup.new(activity_signup_params)

    if @activity_signup.save
      redirect_to @activity_signup, notice: 'Activity signup was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /activity_signups/1
  def update
    if @activity_signup.update(activity_signup_params)
      redirect_to @activity_signup, notice: 'Activity signup was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /activity_signups/1
  def destroy
    @activity_signup.destroy
    redirect_to activity_signups_url, notice: 'Activity signup was successfully destroyed.'
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