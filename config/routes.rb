Rails.application.routes.draw do
  # get 'hello/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'hello#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :items
  resources :reservations

  resources :storages do
    resources :shelves
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
