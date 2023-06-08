Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v0 do
      resources :artists, only: %i[index create]

      get '/artist', to: 'artists#show'
      patch '/artist', to: 'artists#update'
      delete '/artist', to: 'artists#destroy'

      get '/search', to: 'search#index'
      get '/discover', to: 'discover#index'
    end
  end
end
