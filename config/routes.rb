require 'devise'
Jets.application.routes.draw do
  resources :companies
  resources :designs
  root "jets/public#show"
  any "*catchall", to: "jets/public#show"
end
