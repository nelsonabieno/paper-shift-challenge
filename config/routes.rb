Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      ### AUTHENTICATION ###
      post 'auth' => 'user_token#create'
      put '/user/:id/event/:event_id' => 'users#user_assign_event'
      delete '/user/:id/event/:event_id' => 'users#user_unassign_event'
      put '/user/:id/location/:location_id' => 'users#user_assign_location'
      delete '/user/:id/location/:location_id' => 'users#user_unassign_location'

      ### USERS ###
      resources :users

      ### EVENTS ###
      resources :events

      ### LOCATIONS ###
      resources :locations
    end
  end
end
