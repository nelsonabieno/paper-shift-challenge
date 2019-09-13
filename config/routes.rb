Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      ### AUTHENTICATION ###
      post 'auth' => 'user_token#create'

      ### LOGIN ###
      post '/login' => 'authentication#login'

      ### LOGOUT ###
      get '/logout' => 'authentication#logout'

      ### USERS ###
      resources :users

      ### EVENTS ###
      resources :events

      ### LOCATIONS ###
      resources :locations

      resources :events do
        resources :users
      end
    end
  end
end
