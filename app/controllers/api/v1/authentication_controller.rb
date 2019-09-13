module Api
  module V1
    class AuthenticationController < ApplicationController
      def login
        begin
          @user = User.find_by(email: auth_params[:email])
          password =  BCrypt::Password.new(@user.try(:password_digest))

          if password == auth_params[:password]
            @user.authenticate(auth_params[:password])
            jwt = issue({ user: @user.id })
            @user.update({ login_status: true })
            render json: { user: @user, jwt: jwt, message: 'You\'re in!' }
          else
            render json: { message: 'Invalid Password' }, status: :bad_request
          end
        rescue
          render json: { message: 'Invalid Login Details! Please try again!'}, status: :unauthorized
        end
      end


      def logout
        if @current_user
          user = set_user
          user.update({ login_status: false })
          @current_user = nil
          render json: { message: 'Thanks for using our app, good bye' }, status: :ok
        elsif @current_user.nil?
          render json: { message: 'User does not exist' }, status: :not_found
        else
          render json: { message: 'You have to be logged in authentication',  error: @current_user.errors.full_messages }, status: :unauthorized
        end
      end

      private
      def auth_params
        params.permit(:email, :password)
      end

      def set_user
        User.find(@current_user.id) if  @current_user.id
      end
    end
  end
end