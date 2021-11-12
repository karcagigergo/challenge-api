class Api::V1::UsersController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_user, only: [ :show, :update, :destroy ]
  
  def index
    @users = User.page(params[:page] || 1).per(5)
  end

  def home; end

  def show; end
  
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
    @user.status_trash!
    render :show
  end

  private

  def user_params
    params.require(:user).permit(
      :gender,
      :email,
      :phone,
      :cell,
      :status,
      :nat,
      {:name => [:first, :last, :title]},
      {:location => 
        [
          [:street => [:number, :name]], 
          :city, 
          :state, 
          :postcode, 
          [:coordinates => [:latitude, :longitude]], 
          [:timezone => [:offset, :description]]
        ]
      },
      {:picture => [:large, :medium, :thumbnail]}
    )
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_user
    @user = User.find(params[:id])
  end
end