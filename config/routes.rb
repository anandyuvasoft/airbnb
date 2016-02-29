Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users,
             :path => '', :path_names => {:sign_in => 'sign-in', :sign_out => 'sign-out', :sign_up => 'sign-up',
             :edit_profile => 'profile'},
              :controllers => {:omniauth_callbacks => 'omniauth_callbacks', :registrations => 'registrations'}

  resources :users, only: [:show]
  resources :rooms
  resources :photos

  resources :rooms do
    resources :reservations, only: [:create]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :rooms do
    resources :reviews, only: [:create, :destroy]
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get '/your-trips' => 'reservations#your_trips'
  get '/your-reservations' => 'reservations#your_reservations'

  post '/notify' => 'reservations#notify'
  post '/your-trips' => 'reservations#your_trips'

  get '/search' => 'pages#search'
  
end
