class SignupsController < ApplicationController
    #POST /signups
    def create
        new_signup = Signup.create!(signup_params)
        render json: new_signup, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
