
module Api
  module V1
    require 'pry'
    class UsersController < ApplicationController
      before_action :set_user, only: [:user_assign_event, :user_unassign_event, :user_assign_location, :user_unassign_location]
      before_action :set_event, only: [:user_assign_event, :user_unassign_event]
      before_action :set_location, only: [:user_assign_location, :user_unassign_location]


      def user_assign_event
        assign_event_to_user = user_events << @event
        render json: { message: 'Event successfully assigned to user', user: @user, user_events: assign_event_to_user }
      end

      def user_unassign_event
        if user_events.destroy @event
          render json: { message: 'Event successfully unassigned from User' }
        else
          render json: { message: 'Something went wrong while unassigning the event from the user' }
        end
      end

      def user_assign_location
        assign_location_to_user = user_locations << @location
        render json: { message: 'Location successfully assigned to user', user: @user, user_locations: assign_location_to_user }
      end

      def user_unassign_location
        if user_locations.destroy @location
          render json: { message: 'Location successfully unassigned from user' }
        else
          render json: { message: 'Something went wrong while unassigning the location from the user' }
        end
      end

      def user_events
        @user.events
      end

      def user_locations
        @user.locations
      end
:finger
      private

      def set_user
        @user = User.find(params[:id])
      end

      def set_event
        @event = Event.find(params[:event_id])
      end

      def set_location
        @location = Location.find(params[:location_id])
      end

      def user_event_location_params
        params.permit(:id, :event_id, :location_id)
      end

    end
  end
end
