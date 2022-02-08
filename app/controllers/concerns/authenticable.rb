module Authenticable
  private

  def authenticate_with_token
    @token ||= request.headers['Authorization']

    unless valid_token?
      render json: {
        errors: 'Provide an Authorization header to identify yourself.'
      }, status: :unauthorized
    end
  end

  def valid_token?
    @token.present?
  end
end
