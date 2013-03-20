class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user
     @current_user ||= User.find_by_remember_me_token(cookies[:remember_me_token]) if cookies[:remember_me_token]
  end

  helper_method :current_user #allows the method current_user to be accessed in the view



  def create_permanent_session(user)
    cookies.permanent[:remember_me_token] = user.remember_me_token
    session[:user_id] = user.id
  end

  def create_temporary_session(user)
    cookies[:remember_me_token] = user.remember_me_token
    session[:user_id] = user.id
  end

  def destroy_session
    session[:user_id] = nil
    cookies.delete(:remember_me_token)
    current_user = nil
  end


  def authorize
    unless current_user
      flash.alert = "You must login First"
      redirect_to index_url

    end
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user == @user
  end

end
