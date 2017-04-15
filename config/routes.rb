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

  resources :rooms do
    resources :purchases, only: [:create]
  end

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get '/your-trips' => 'reservations#your_trips'
  get '/your-reservations' => 'reservations#your_reservations'

  get '/your-sales' => 'purchases#your_sales'
  get '/your-purchases' => 'purchases#your_purchases'

  post '/notify' => 'reservations#notify'
  post '/your-trips' => 'reservations#your_trips'

  post '/notify' => 'purchases#notify'
  post '/your-sales' => 'purchases#your_sales'

  get '/search' => 'pages#search'
  
end
