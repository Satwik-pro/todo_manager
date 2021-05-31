class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_displayable_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_displayable_string
  end

  def new
    render "users/new"
  end

  def create
    # name = params[:name]
    # email = params[:email]
    # password = params[:password]
    # new_user = User.create!(
    #   first_name: first_name,
    #   last_name: last_name
    #   email: email,
    #   password: password,
    # )
    # response_text = "New user created with ID: #{new_user.id}"
    # render plain: response_text

    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )

    redirect_to "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    users = User.where("email = ? and password_digest = ?", email, password)
    response = !users.empty?
    render plain: response
  end
end
