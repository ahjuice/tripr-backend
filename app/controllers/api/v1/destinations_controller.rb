class Api::V1::DestinationsController < ApplicationController
  before_action :find_destination, only: [:show, :activities, :destination_activity]
    def index
      @destinations = Destination.all
      render json: @destinations
    end

    def show
      @destination
      render json: @destination
    end

    def activities
      @destination
      render json: @destination.activities
    end

    def destination_activity
      @activity = Activity.find(params[:id])
      @destination
      byebug
      if @destination.activities.include? @activity
        render json: @activity
      else
        render json: @destination
      end
    end

    private

    ### might need later, if we let users create destinations
    # def destination_params
    #   params.permit(:name, :country, :thumbnail, :description)
    # end

    def find_destination
      @destination = Destination.find(params[:id])
    end
end
