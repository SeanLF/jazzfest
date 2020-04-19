Rails.application.routes.draw do
  root 'public_pages#home'

  # Authentication
  get '/login', to: 'authentication#login', as: :login
  get '/authentication/callback' => 'authentication#callback', as: :authentication_callback
  get '/authentication/failure' => 'authentication#failure', as: :authentication_failure
  get '/logout', to: 'authentication#logout', as: :logout
  
  get 'public_pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
