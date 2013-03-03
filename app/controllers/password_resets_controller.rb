class PasswordResetsController < ApplicationController

  def new
  end

  def create
    if params[:user][:email] =~ VALID_EMAIL_REGEX
      user = User.find_by_email(params[:user][:email])

      if user
        user.send_password_reset(user)
        redirect_to root_url, notice: "an email has been sent to the address #{user.email}"
      else
        flash.now[:alert] = "Unable to find user with email #{params[:user][:email]}"
        render 'new'
      end
    else
      flash.now[:alert] = "Please provide a valid email address"
      render 'new'
    end
  end

  def edit
    @user = User.find_by_password_reset_token(params[:id])
    unless @user
      redirect_to new_password_reset_path, alert: "Session has expired, please re-enter your email"
    end

  end

  def update

    @user = User.find_by_password_reset_token!(params[:id])

    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Password reset has expired"
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, notice: "Password has been reset"
    else
      render 'edit'
    end
  end
end
