module SessionsHelper

  def create_permanent_cookie(user)
    cookies.permanent[:remember_me_token] = user.remember_me_token
  end

  def create_temporary_cookie(user)
    cookies[:remember_me_token] = user.remember_me_token
  end

end