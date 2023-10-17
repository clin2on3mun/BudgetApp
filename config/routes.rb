Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :categories , only: [:index, :new, :create] do
    resources :payments, only: [:index, :new, :create]
  end
  root to: "categories#index"
end
