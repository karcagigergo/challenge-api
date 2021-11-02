class Api::V1::UsersController < Api::V1::BaseController
  #acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_restaurant, only: [ :show, :update ]
  
  def index
    @users = User.all
  end

  def show
  end
  
  def update
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:gender, :name, :location, :email, :login, :phone, :cell, :picture)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_user
    @user = User.find(params[:id])
  end
end