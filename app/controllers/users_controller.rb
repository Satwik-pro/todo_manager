class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /users or /users.json
  def index
    # @users = User.all
    render plain: User.order(:id).map { |user| user.to_displayable_string }.join("\n")
  end

  # GET /users/1 or /users/1.json
  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_displayable_string
  end

  # GET /users/new
  # def new
  #   @user = User.new
  # end

  # GET /users/1/edit
  # def edit
  # end

  # POST /users or /users.json
  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "New user created with ID: #{new_user.id}"
    render plain: response_text

    # @user = User.new(user_params)

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: "User was successfully created." }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def login
    email = params[:email]
    password = params[:password]
    is_user = User.all.where("email = ? and password = ?", email, password)
    response = is_user.empty? ? "False" : "True"
    render plain: response
  end

  # PATCH/PUT /users/1 or /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: "User was successfully updated." }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /users/1 or /users/1.json
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: "User was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # # Only allow a list of trusted parameters through.
    # def user_params
    #   params.require(:user).permit(:name, :email, :password)
    # end
end
