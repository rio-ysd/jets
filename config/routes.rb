require 'devise'
Jets.application.routes.draw do
  resources :companies
  root "jets/public#show"
  any "*catchall", to: "jets/public#show"
end
