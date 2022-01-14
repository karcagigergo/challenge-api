module Api
  module V1
    class UsersController < BaseController
      # acts_as_token_authentication_handler_for User, except: [ :index, :show ]
      before_action :set_user, only: %I[show update destroy]

      def index
        @users = User.page(params[:page] || 1).per(params[:per_page] || 10)
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
          render json: @user, status: :created
        else
          render_error
        end
      end

      def destroy
        @user.status = "trash"
      end

      private

      def user_params
        params.require(:user).permit(
          :password,
          :gender,
          :email,
          :phone,
          :cell,
          :status,
          :nat,
          { name: %I[first last title] },
          { location:
            [
              [street: %I[number name]],
              :city,
              :state,
              :postcode,
              [coordinates: %I[latitude longitude]],
              [timezone: %I[offset description]]
            ] },
          { picture: %I[large medium thumbnail] }
        )
      end

      def render_error
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
