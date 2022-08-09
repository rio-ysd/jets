require 'devise'
Jets.application.routes.draw do
  resources :companies
  resources :designs
  namespace :mypage do
    resources :layouts
  end
  root "jets/public#show"
  any "*catchall", to: "jets/public#show"
end
