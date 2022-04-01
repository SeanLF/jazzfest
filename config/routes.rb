# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get "/:locale", to: "public_pages#home"
    root to: "public_pages#home"

    # No views, so no locale
    resources :users

    # locale
    get "/change_language", to: "application#change_language"
  end

  # Authentication
  get "/authentication/callback" => "authentication#callback", as: :authentication_callback
  get "/authentication/failure" => "authentication#failure", as: :authentication_failure
  get "/login", to: "authentication#login", as: :login
  get "/logout", to: "authentication#logout", as: :logout
  get "/auth/callback" => "authentication#callback"
  get "/auth/failure" => "authentication#failure"
  get "/auth/logout" => "authentication#logout"
end
