class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    authorize! :read, @users
    @users = user.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize! :read, @user
  end

  # GET /users/new
  def new
    @user = user.new
    authorize! :create, @user
  end

  # GET /users/1/edit
  def edit
    authorize! :read, @user
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :dj_name, :first_name, :last_name, 
                                   :phone_number)
    end
end
