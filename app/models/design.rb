class Design < ApplicationRecord
  belongs_to :company
  belongs_to :layout
  has_many :pages
end
