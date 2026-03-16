Rails.application.routes.draw do
  devise_for :users, skip: :all

  devise_scope :user do
    post 'api/v1/auth/sign_up', to: 'api/v1/users/registrations#create'
    post 'api/v1/auth/sign_in', to: 'api/v1/users/sessions#create'
    delete 'api/v1/auth/sign_out', to: 'api/v1/users/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      get 'me', to: 'users/me#show'

      concern :likeable do
        resources :likes, only: [:create, :destroy]
      end

      concern :commentable do
        resources :comments, only: [:index, :create]
      end

      resources :questions, concerns: [:likeable, :commentable] do
        resources :answers, concerns: [:likeable, :commentable]
      end

      resources :comments, concerns: [:likeable]
    end
  end
end
