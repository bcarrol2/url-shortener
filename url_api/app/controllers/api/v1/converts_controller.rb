class Api::V1::ConvertsController < ApplicationController
    skip_before_action :verify_authenticity_token
    # skipping authenticity token for cors purposes from client request headers
    
    def index
    end

    def create
        # creates a new Convert by the private params unless there is an issue
        @converted = Convert.create!(convert_params)
        if @converted
            render json: @converted
        else
            render json: @converted.errors
        end
    end

    def show
        # finding the url from the Convert model by the url_endpoint attribute from the latest params
        # and heading to the original link
        uri = Convert.find_by(url_endpoint: params[:id])
        redirect_to uri.long_url
    end
    
    private
    
    def convert_params
        new_endpoint = Random.rand(1000000..9999999).to_s
        # generates a random 7 digit number ex: 1082373
        main_url = 'http://localhost:3000/stordy'
        tiny_url = main_url + '/' + new_endpoint
        params.require(:convert).permit(:long_url).merge(new_url: tiny_url, url_endpoint: new_endpoint).freeze
        # calling freeze here to prevent a new random number from being generated for find_by purposes
    end
end
