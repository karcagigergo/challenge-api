module Api
  module V1
    class PagesController < ActionController::API
      rescue_from StandardError,                with: :internal_server_error
      # rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      def home
        puts "REST Back-end Challenge 20201209 Running"
      end

      private

      def user_not_authorized(exception)
        render json: {
          error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
        }, status: :unauthorized
      end

      def not_found(exception)
        render json: { error: exception.message }, status: :not_found
      end

      def internal_server_error(exception)
        if Rails.env.development?
          response = { type: exception.class.to_s, error: exception.message }
        else
          response = { error: "Internal Server Error" }
        end
        render json: response, status: :internal_server_error
      end
    end
  end
end
