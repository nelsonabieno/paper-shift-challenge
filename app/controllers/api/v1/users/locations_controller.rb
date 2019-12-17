module Api
  module V1
    class Users::LocationsController < ApplicationController
      before_action :set_location, :set_user, only: [:update, :destroy]

      def update
        user_locations << @location
        render json: { message: 'Location successfully assigned to user', user: @user, user_locations: user_locations }
      end

      def destroy
        if user_locations.destroy @location
          render json: { message: 'Location successfully unassigned from user' }
        else
          render json: { message: 'Something went wrong while unassigning the location from the user' }
        end
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def set_location
        @location = Location.find(params[:id])
      end

      def user_locations
        @user.locations
      end
    end
  end
end
