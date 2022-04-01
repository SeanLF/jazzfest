# frozen_string_literal: true

Rails.application.routes.draw do
  unless Time.current <= Date.parse("2020/09/01")
    # root '/covid19.html'
    root to: "home#landing"
  end

  get "/home" => "home#landing"

  get "/auth/auth0", as: "login"
  get "/auth/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/logout" => "logout#logout"

  resources :opportunity_applications do
    get :review, on: :member
  end
  resources :volunteer_opportunities
  resources :profiles
  resources :settings
  resources :events

  get "/apply" => "dashboard#apply"
  get "/apply/success" => "dashboard#success"
  get "/dashboard" => "dashboard#elevated_user_dashboard"

  get "help" => "home#help"
  get "code_of_conduct" => "home#code_of_conduct"
  get "privacy_policy" => "home#privacy_policy"

  get "reports/export_opportunity_applications" => "report#export_opportunity_applications"
  get "reports/export_opportunity_application_coordinator_comments" => "report#export_opportunity_application_coordinator_comments"
end
