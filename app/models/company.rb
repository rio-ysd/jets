class Company < ApplicationRecord
  has_many :users
  has_many :layouts
  has_many :designs
  has_many :pages
end
