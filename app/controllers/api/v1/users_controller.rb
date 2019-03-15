module Api
  module V1
    class UsersController < ApplicationController
      # GET /users
      def index
        @users = user.all

        render json: @users
      end
    end
  end
end
