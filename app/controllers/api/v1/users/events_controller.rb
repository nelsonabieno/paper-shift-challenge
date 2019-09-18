module Api
  module V1
    class Users::EventsController < ApplicationController
      before_action :set_user, :set_event, only: [:update, :destroy]

      def update
        user_events << @event
        render json: { message: 'Event successfully assigned to user', user: @user, user_events: user_events }
      end

      def destroy
        if user_events.destroy @event
          render json: { message: 'Event successfully unassigned from User' }
        else
          render json: { message: 'Something went wrong while unassigning the event from the user' }
        end
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def set_event
        @event = Event.find(params[:id])
      end

      def user_events
        @user.events
      end
    end
  end
end
