class Api::V1::HomeController < ApplicationController
  def generate_token
    user = User.find_by_email(params[:email]) rescue ''
    if user.present? and user.valid_password?(params[:password])
      render json: { status: 200, token: user.token}
    else
      render json: { status: 403, error: true, message: "Please check email and password"}
    end
  end
end
