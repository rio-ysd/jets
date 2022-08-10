class Layout < ApplicationRecord
  belongs_to :company
  has_many :designs
end
