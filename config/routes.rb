Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users

      ### EVENTS ###
      resources :events

      ### LOCATIONS ###
      resources :locations

      resources :users do
        resources :events, module: :users, only: [:update, :destroy]
        resources :locations, module: :users, only: [:update, :destroy]
      end
    end
  end
end
