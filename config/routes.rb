# require 'devise'
Jets.application.routes.draw do
  resources :companies

  get     'login',   to: 'sessions#new', as: 'login'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'

  namespace :mypage do
    resources :layouts
    resources :pages
    resources :designs
    resources :users
  end
  root "jets/public#show"
  any "*catchall", to: "jets/public#show"
end
