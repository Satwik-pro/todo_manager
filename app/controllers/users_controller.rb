class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

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
    # first_name = params[:first_name]
    # last_name = params[:last_name]
    # email = params[:email]
    # password = params[:password]
    # new_user = User.create!(
    #   first_name: first_name,
    #   last_name: last_name,
    #   email: email,
    #   password: password,
    # )
    # response_text = "New user created with ID: #{new_user.id}"
    # render plain: response_text

    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )

    if new_user.save
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    users = User.where("email = ? and password_digest = ?", email, password)
    response = !users.empty?
    render plain: response
  end
end
