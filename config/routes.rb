Rails.application.routes.draw do
  resources :opportunity_applications
  resources :volunteer_opportunities
  resources :profiles

  root to: 'home#show'

  get '/apply' => 'dashboard#show'
  get '/apply/success' => 'dashboard#success'

  get '/auth/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'

  get '/logout' => 'logout#logout'

  get 'code_of_conduct' => 'home#code_of_conduct'
end
