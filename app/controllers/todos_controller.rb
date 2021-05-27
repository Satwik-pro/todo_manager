# todos_controller.rb
class TodosController < ApplicationController
  def index
    render plain: Todo.order(:id).map { |todo| todo.to_displayable_string }.join("\n")
  end

  def show
    id = params[:id]
    # render plain: Todo.where("id = ?",id).map { |todo| todo.to_displayable_string }
    todo = Todo.find(id)
    render plain: todo.to_displayable_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = Date.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    response_text = "New Todo created with ID: #{new_todo.id}"
    render plain: response_text
  end
end
