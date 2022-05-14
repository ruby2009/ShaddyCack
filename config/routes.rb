Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "annual_sign_up#index"
  resources :players, only: [:create]
  resources :scorecards, only: [:show]
  resources :player_event_holes, only: [:index, :show, :edit, :update]
end
