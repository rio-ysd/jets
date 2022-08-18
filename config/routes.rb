# require 'devise'
Jets.application.routes.draw do
  get 'preview/:id', to: 'preview#show'
  get     'login',   to: 'sessions#new', as: 'login'
  post    'login',   to: 'sessions#create'
  get  'logout',  to: 'sessions#destroy'

  namespace :admin do
    resources :companies
  end

  namespace :mypage do
    get 'analytics', to: 'analytics#index'
    resources :layouts
    resources :pages
    resources :designs
    resources :users
  end
  root 'sessions#new'
  any "*catchall", to: "jets/public#show"
end
