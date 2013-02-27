class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_by_email(params[:email])

      if user && user.authenticate(params[:password])
        if params[:remember_me]
          create_permanent_cookie(user)
        else
          create_temporary_cookie(user)
        end
        create_session(user)

        redirect_to user_path(user), notice: "logged in!"
      else
        flash.now.alert = "Invalid email or password"
        render 'new'
      end

  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:remember_me_token)
    redirect_to root_url, notice: "Logged out"

  end

end
