Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  resources :keywords
  resources :groups
  resources :posts
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #api/v1 routes
  namespace :api do
    namespace :v1 do
      resources :groups, only: [:index, :show] 
      resources :posts, only: [:index, :show] 
      resources :keywords
        post 'home/generate_token'
    end
  end

end
