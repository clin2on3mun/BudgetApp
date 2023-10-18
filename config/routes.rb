Rails.application.routes.draw do
  root to: "splashs#index"
  devise_for :users
  devise_scope :user do

    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :categories , only: [:index, :new, :create] do
    resources :payments, only: [:index, :new, :create]
  end
end
