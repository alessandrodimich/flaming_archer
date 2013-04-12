class SessionsController < ApplicationController




  def new
  end

  def create

    user = User.find_by_email(params[:user][:email])

      if user && user.authenticate(params[:user][:password])
        if params[:user][:remember_me] == "1"
          create_permanent_session(user)
        else
          create_temporary_session(user)
        end

        redirect_to user_path(user), notice: "logged in!"
      else
        flash.now.alert = "Invalid email or password"
        render 'new'
      end

  end

  def destroy
    destroy_session
    redirect_to root_url, notice: "Logged out"
  end

end
