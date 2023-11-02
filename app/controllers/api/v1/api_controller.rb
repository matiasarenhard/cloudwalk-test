# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      before_action :authenticate_user_from_token!

      private

      def authenticate_user_from_token!
        if token = params[:authentication_token].presence
          unless User.find_by_authentication_token(token)
            render json: { error: 'Authentication failed' }, status: :unauthorized
          end
        end
      end
    end
  end
end