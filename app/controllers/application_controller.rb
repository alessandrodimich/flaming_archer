class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper


private

  def current_user
     @current_user ||= User.find_by_remember_me_token(cookies[:remember_me_token]) if cookies[:remember_me_token]
  end

  helper_method :current_user #allows the method current_user to be accessed in the view

  def create_session(user)
    session[:user_id] = user.id
  end

  def authorize
    unless current_user
      flash.alert = "You must login First"
      redirect_to index_url

    end
  end

end
