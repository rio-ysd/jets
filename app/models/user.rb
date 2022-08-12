class User < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  validates :name, uniqueness: true
  validates :email, uniqueness: true


end
