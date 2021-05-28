class User < ApplicationRecord
  def to_displayable_string
    "#{id}. #{name} #{email} #{password}"
  end
end
