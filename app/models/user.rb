class User < ApplicationRecord
  belongs_to :company

  validates :name, uniqueness: true
  validates :email, uniqueness: true

end
