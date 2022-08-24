class User < ApplicationRecord
  belongs_to :company

  has_secure_password validations: true

  validates :email, presence: true, uniqueness: true

  def read_only?
    puts '111111-------------------'
    roles.include? 0
  end

  def page?
    puts '222222-------------------'
    roles.include? 1
  end

  def designer?
    puts '333333-------------------'
    roles.include? 2
  end

  def subscriber?
    puts '444444-------------------'
    roles.include? 4
  end

  def roles
    _role = role
    _roles = []
    [4, 2, 1, 0].each do |i|
      next if _role - i < 0
      _roles.push i
      _role -= i
    end
    _roles
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end
end