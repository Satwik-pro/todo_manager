class Todo < ActiveRecord::Base
  def to_displayable_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{is_completed} #{todo_text} #{due_date}"
  end
end
