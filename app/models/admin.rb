class Admin < ApplicationRecord
    has_many :users
    has_many :company
end
