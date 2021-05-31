class User < ApplicationRecord
  has_many :todos
  has_secure_password

  def to_displayable_string
    "#{id}. #{first_name} #{last_name} #{email} #{password_digest}"
  end
end
