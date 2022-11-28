class ActivitiesController < ApplicationController
    #GET /activities
    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    #DELETE /activities/:id
    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Activity not found"}, status: :not_found
    end
end
