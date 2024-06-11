class ApplicationController < ActionController::API
  before_action :authenticate

  private

  def authenticate
    token = request.headers['Authorization']
    @current_user = User.find_by(token:)
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  end
end
