class User < ApplicationRecord
  has_secure_password
  has_many :reviews

  validates :email, :firstname, :lastname,
    presence: true

  def full_name
    "#{firstname} #{lastname}"
  end
end
