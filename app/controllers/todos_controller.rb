class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.order(:id).map { |todo| todo.to_displayable_string }.join("\n")
  end

  def show
    id = params[:id]
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

  def update
    id = params[:id]
    completed = params[:completed]
    todo_text = params[:todo_text]
    todo = Todo.find(id)
    todo.completed = completed
    todo.todo_text = todo_text
    todo.save!
    render plain: "Updated todo completed status to #{completed} and todo text to #{todo_text}"
  end
end
