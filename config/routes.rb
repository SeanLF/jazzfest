Rails.application.routes.draw do
  resources :settings
  resources :events
  root to: 'home#landing'

  resources :opportunity_applications
  resources :volunteer_opportunities
  resources :profiles

  get '/apply' => 'dashboard#show'
  get '/apply/success' => 'dashboard#success'

  get '/auth/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/logout' => 'logout#logout'

  get 'help' => 'home#help'
  get 'code_of_conduct' => 'home#code_of_conduct'
  get 'privacy_policy' => 'home#privacy_policy'
end
