class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def show
        gym = find_gym
        render json: gym
    end

    def index
        render json: Gym.all 
    end

    def update
        gym = find_gym
        gym.update!(gym_params)
        render json: gym, status: :accepted
    end

    def destroy
        gym = find_gym
        gym.destroy
        head :no_content, status: :no_content
    end
    
    private

    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.permit(:name, :address)
    end

    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end
end
