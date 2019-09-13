
module Api
  module V1
    class UsersController < ApplicationController

      before_action :set_user, only: [:show, :update, :destroy]

      def index
        @users = User.all.where(:deleted_at => 'NULL')
        render json: { users: @users }, status: :ok
      end

      def create
        # binding.pry
        user = User.new(user_params)

        if user.save
          render json: { message: 'User successfully created', user: user} , status: :created
        else
          render json: { error: user.errors.full_messages }, status: :internal_server_error
        end
        # binding.pry
      end

      def show
        render json: { user: @user }
      end

      def update
        if @user.update(user_params)
          render json: {  user: @user, message: 'User details updated'}, status: :ok
        else
          render json: { error: @user.errors.full_messages }, status: :internal_server_error
        end
      end

      def destroy
        if @user.destroy
          render json: { message: 'User details deleted!' }, status: :ok
        else
          render json: { error: @user.errors.full_messages }, status: :internal_server_error
        end
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.permit(:name, :email, :password)
      end
    end
  end
end
