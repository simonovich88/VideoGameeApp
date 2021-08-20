Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'video_games#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/', to: 'video_games#index' # I can browse all available Video game, I can sort the Video game by genre
  # get '/video_game/:id', to: 'video_games#show' # I can check the details of a certain Video game
  # get '/video_games/new', to:'video_games#new' # I can add a Video game for rent
  # delete '/video_games/:id', to:'video_games#destroy' # I can delete a Video game for rent
  # post '/video_game', to:'video_games#create'

  # post '/rental_request', to:'rental_requests#create' #I can request to rent a Video game
  # get 'rental_requests/accepted', to:'rental_request#accepted_rentals' # I can see Video game that I’ve already rented
  # get '/rental_request', to:'rental_requests#index' # I can see all the rental requests and decide yes/no (owner)
  #                                                   # I can see the status of my rental requests
  # Edit/ Update: As a renter, I can choose to accept or reject a rental request

  # get '/user/:id', to:'users#show' # I can check an owner’s profile and listings

  # post '/wishlists', to: 'wishlist#create' #I can make a list of Video game that I’d like to rent (extra)
  # get '/wishlists', to: 'wishlist#index' # I can view my wishlist of Video game (extra)


  resources :rental_requests, only: [:index, :create]

  get "rental_requests/history", to: "rental_requests#history", as: :request_history
  patch "rental_requests/:id/accept", to: "rental_requests#accept_request", as: :accept_request
  patch "rental_requests/:id/reject", to: "rental_requests#reject_request", as: :reject_request


  resources :users, only: [:show, :edit, :update]
  get "users/:id/my_listings", to: "users#my_listings", as: :my_listings

  resources :video_games, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :wishlists, only: [:create]
  end

  resources :wishlists, only: [:index, :destroy]

  get '/api/news' => 'api#news'
  get '/api/:fecha1/:fecha2' => 'api#video_game_filter'
  post '/api', action: :create, controller: 'api'


end
