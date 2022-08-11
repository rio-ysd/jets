require 'devise'
Jets.application.routes.draw do
  resources :companies
  namespace :mypage do
    get 'analytics', to: 'analytics#index'
    resources :layouts
    resources :pages
    resources :designs
    resources :users
  end
  root "jets/public#show"
  any "*catchall", to: "jets/public#show"
end
