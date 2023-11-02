class ApplicationController < ActionController::API
  before_action :authenticate_user_from_token!

  private

  def authenticate_user_from_token!
    if request.blank? || request.headers['Authorization'].blank? || User.find_by_authentication_token(request.headers['Authorization']).blank?
      render json: { error: 'Authentication failed' }, status: :unauthorized
    end
  end
end
