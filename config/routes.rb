Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'devise_users/registrations'
   }
  resources :users do
    collection do
       get   'logout'
    end
    resources :addresses,only: [:new,:create]
  end

  resources :items do
    collection do
      get 'method_of_payment'
      post 'payment'
    end

    post 'images' => 'images#create'
  end
  root 'items#index'
  get   'users/sign_up/6'  =>  'users#registration_completion'




end
