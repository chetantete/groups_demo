class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def set_user
  	user = User.find_by_token(request.headers["Authorization"]) rescue ''
  	if user.present?
  		@current_user = user
  	else
      render json: { status: 403, error: true, message: "Check Authorization"}
  	end
  end
end
