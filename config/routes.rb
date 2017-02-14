Rails.application.routes.draw do
  get 'dashboard/show'

  root to: 'home#show'

  get '/dashboard' => 'dashboard#show'

  get '/auth/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'

  get '/logout' => 'logout#logout'
end
