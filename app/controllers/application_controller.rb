class ApplicationController < ActionController::Base
  protect_from_forgery


private

  def current_user
     @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user #alllows the moethod current_user to be accessed in the view

  def create_session(user)
    session[:user_id] = user.id
  end

  def authorize
    unless current_user
      redirect_to welcome_url, alert: "Not authorized"
    end


  end

end
