class User < ApplicationRecord
  has_many :todos
  has_secure_password

  validates :first_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, length: { minimum: 3 }
  validates :email, length: { minimum: 5 }
  validates :password, length: { minimum: 8 }

  def to_displayable_string
    "#{id}. #{first_name} #{last_name} #{email} #{password_digest}"
  end
end
