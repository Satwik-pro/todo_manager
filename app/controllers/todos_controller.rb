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
end
