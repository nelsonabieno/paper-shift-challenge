Rails.application.routes.draw do
  resources :events_locations
  namespace :api do
    namespace :v1 do
      ### AUTHENTICATION ###
      post 'auth' => 'user_token#create'

      ### USERS ###
      resources :users

      ### EVENTS ###
      resources :events

      ### LOCATIONS ###
      resources :locations
    end
  end
end
