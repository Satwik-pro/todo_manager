class Todo < ActiveRecord::Base
  belongs_to :user
  # table users
  # column user_id

  def to_displayable_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{is_completed} #{todo_text} #{due_date}"
  end

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.of_user(user)
    where(user_id: user.id)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    where(completed: true)
  end
end
