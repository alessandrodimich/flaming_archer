class HomeController < ApplicationController
  def welcome
    redirect_to user_path(current_user) if current_user
  end

  def index
  end
end
