class CampersController < ApplicationController
    #GET /campers
    def index
        campers = Camper.all 
        render json: campers, status: :ok, except: [:created_at, :updated_at]
    end

    #GET /campers/:id
    def show
        camper = Camper.find(params[:id])
        render json: camper, except: [:created_at, :updated_at], include: :activities
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Camper not found"}, status: :not_found
    end

    #POST /campers
    def create
        new_camper = Camper.create!(camper_params)
        render json: new_camper, status: :created, include: :activities
    rescue ActiveRecord::RecordInvalid => e
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

    private
    def camper_params
        params.permit(:name, :age)
    end
end
