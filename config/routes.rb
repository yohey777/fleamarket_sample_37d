Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: :show
  resources :items do
    post 'images' => 'images#create'
  end

  get   'address/new' => 'addresses#new'
  get   'users/sign_up/2'  =>  'users#telephone_registration'
  get   'users/sign_up/3'  =>  'users#phone_authentication'
  get   'users/sign_up/4'   =>  'users#address_input'
  get   'users/sign_up/5'   =>  'users#method_of_payment'
  get   'users/sign_up/6'   =>  'users#registration_completion'

end
