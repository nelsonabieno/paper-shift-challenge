Rails.application.routes.draw do
  resources :events
  resources :locations
  namespace :api do
    namespace :v1 do
      ### AUTHENTICATION ###
      post 'auth' => 'user_token#create'

      ### USERS ###
      resources :users
    end
  end
end
