class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_authorization_check only: [:index]

  # GET /users
  # GET /users.json
  def index
    @users = User.page(page).per(per_page).accessible_by(current_ability)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize! :read, @user
  end

  # GET /users/1/edit
  def edit
    authorize! :update, @user
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    old_role = @user.role
    authorize! :update, @user
    @user.assign_attributes user_params
    if @user.role != old_role && !@user.admin?
      message = 'Cannot change user role.'
      respond_to do |format|
        format.html {
          flash[:warning] = message
          redirect_to @user
        }
        format.json { render json: {error: message, status: :unauthorized} }
      end
      return
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Updated!' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :dj_name, :first_name, :last_name,
                                 :phone_number, :password,
                                 :password_confirmation, :role)
  end
end
