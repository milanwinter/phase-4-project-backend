Rails.application.routes.draw do
  resources :playlists do
    resources :likes
  end
  resources :videos
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      
    end
  end
end

