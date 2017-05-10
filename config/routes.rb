Rails.application.routes.draw do

  root 'pages#home'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)  


  devise_for :users,
             :path => '', :path_names => {:sign_in => 'sign-in', :sign_out => 'sign-out', :sign_up => 'sign-up',
             :edit_profile => 'profile'},
              :controllers => {:omniauth_callbacks => 'omniauth_callbacks', :registrations => 'registrations'}

  resources :users, only: [:show]
  resources :doctors, only: [:show]
  resources :patients, only: [:show]
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

  post '/purchase_notify' => 'purchases#notify'
  #post '/your-sales' => 'purchases#your_sales'

  get '/search' => 'pages#search'
  get '/dashboard' => 'pages#dashboard'
  

  resources :activities, only: [:index]
  resources :room_steps, only: [:show, :create, :update, :index]
  
  get '/family-members' => 'users#family_members'

  get 'users/:id/friends' => 'users#friends' , as: :friends
  get 'users/:id/relatives' => 'users#relatives'
  get 'users/:id/bookings' => 'users#bookings'
  
  get 'doctor/:id/leads' => 'doctors#leads', as: :leads 
  
  delete 'relative/:id' => "users#remove_relative"
  delete 'friend/:id' => "users#remove_friend"
  delete 'booking/:id' => "users#remove_booking"

  resources :bookings, only: [:create,:index]
  get '/rooms/:room_id/booking' => "bookings#step_first"
  get '/sample' => "pages#sample"
  get '/test' => "pages#test"
  resources :booking_steps
  resources :categories, only: [:show]
  
end
