class Api::V1::ActivitySignupsController < Api::V1::GraphitiController
  def index
    activity_signups = ActivitySignupResource.all(params)
    respond_with(activity_signups)
  end

  def show
    activity_signup = ActivitySignupResource.find(params)
    respond_with(activity_signup)
  end

  def create
    activity_signup = ActivitySignupResource.build(params)

    if activity_signup.save
      render jsonapi: activity_signup, status: 201
    else
      render jsonapi_errors: activity_signup
    end
  end

  def update
    activity_signup = ActivitySignupResource.find(params)

    if activity_signup.update_attributes
      render jsonapi: activity_signup
    else
      render jsonapi_errors: activity_signup
    end
  end

  def destroy
    activity_signup = ActivitySignupResource.find(params)

    if activity_signup.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: activity_signup
    end
  end
end
