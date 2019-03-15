module Api
  module V1
    class EventsLocationsController < ApplicationController
      before_action :set_events_location, only: [:show, :update, :destroy]

      # GET /events_locations
      def index
        @events_locations = EventsLocation.all

        render json: @events_locations
      end

      # GET /events_locations/1
      def show
        render json: @events_location
      end

      # POST /events_locations
      def create
        @events_location = EventsLocation.new(events_location_params)

        if @events_location.save
          render json: @events_location, status: :created, location: @events_location
        else
          render json: @events_location.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /events_locations/1
      def update
        if @events_location.update(events_location_params)
          render json: @events_location
        else
          render json: @events_location.errors, status: :unprocessable_entity
        end
      end

      # DELETE /events_locations/1
      def destroy
        @events_location.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_events_location
        @events_location = EventsLocation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def events_location_params
        params.fetch(:events_location, {})
      end
    end

  end
end

