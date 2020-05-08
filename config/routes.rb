Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get '/:locale' , to: 'public_pages#home'
    root to: 'public_pages#home'

    # Authentication
    get '/login', to: 'authentication#login', as: :login
    get '/authentication/callback' => 'authentication#callback', as: :authentication_callback
    get '/authentication/failure' => 'authentication#failure', as: :authentication_failure
    get '/logout', to: 'authentication#logout', as: :logout

    # locale
    get '/change_language', to: 'application#change_language'
  end
end
