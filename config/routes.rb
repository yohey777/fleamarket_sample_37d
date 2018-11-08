Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'devise_users/registrations'
   }

  resources :addresses,only: [:new,:create]
  resources :users, only: :show
  resources :items do
    collection do
      get 'method_of_payment'
      post 'payment'
    end

    post 'images' => 'images#create'
  end

  get   'address/new' => 'addresses#new'
  get   'users/sign_up/2'  =>  'users#telephone_registration'
  get   'users/sign_up/3'  =>  'users#phone_authentication'
  get   'users/sign_up/4'   =>  'users#address_input'
  get   'users/sign_up/6'   =>  'users#registration_completion'

  root 'items#index'
  get   'address/new' => 'addresses#new'
  get   'users/sign_up/2'  =>  'users#telephone_registration'
  get   'users/sign_up/3'  =>  'users#phone_authentication'
  get   'users/sign_up/5'   =>  'users#method_of_payment'
  get   'users/sign_up/6'   =>  'users#registration_completion'


end
