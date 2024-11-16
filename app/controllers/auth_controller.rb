
class AuthController < ApplicationController
  before_action :authenticate_user!, only: [ :validate_token ]

  def validate_token
    token = request.headers["access-token"]
    uid = request.headers["uid"]
    client = request.headers["client"]

    if token.blank? || uid.blank? || client.blank?
      render json: { verified: false, error: "Missing token, uid, or client" }, status: :unauthorized
      return
    end

    if current_user
      render json: { verified: true, user: current_user }
    end
  end
end
