Rails.application.routes.draw do
 # resources :reviews
 # resources :careers
 # resources :universities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/universities', to: 'universities#index'
  post '/universities', to: 'universities#create'
  get '/universities/:id', to: 'universities#show'
  patch '/universities/:id', to: 'universities#update'
end
