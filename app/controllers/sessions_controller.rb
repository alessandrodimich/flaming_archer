class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_by_email(params[:email])

      if user && user.authenticate(params[:password])
        create_session(user)
        redirect_to root_url, notice: "logged in!"
      else
        flash.now.alert = "Invalid email or password"
        render 'new'
      end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"

  end

end