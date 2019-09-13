class ApplicationController < ActionController::API
  ALGORITHM = 'HS256'

  def issue(payload)
    JWT.encode(
        payload.merge(exp: 1440.minutes.from_now.to_i),
        auth_secret,
        ALGORITHM
    )
  end

  def decode(token)
    begin
      JWT.decode( token,
                  auth_secret,
                  true,
                  { algorithm: ALGORITHM }).first
    rescue
      render json: { message: 'Invalid Token' }, status: :unauthorized
    end
  end

  private
  def auth_secret
    ENV['AUTH_SECRET']
  end
end
