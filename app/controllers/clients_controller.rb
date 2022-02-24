class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_found_response


    def index 
        render json: Client.all
    end

    def show
        client = find_client
        render json: client, methods: [:total_membership_cost]
    end

    def update
        client = find_client
        client.update!(client_params)
        render json: client, status: :accepted
    end

    private 

    def find_client
        Client.find(params[:id])
    end

    def client_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Client not found" }
    end
end
