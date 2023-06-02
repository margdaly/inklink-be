Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      resources :users, only: [:show, :create, :update] do
        get '/search', to: 'users#search'
      end
      resources :artists, only: [:show, :create, :update]
    end
  end
end