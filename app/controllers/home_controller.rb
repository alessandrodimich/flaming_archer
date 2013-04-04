class HomeController < ApplicationController
  def welcome
    redirect_to user_path(current_user) if current_user
  end

  def index
  end

  def prova
    render layout: 'home_prova'
  end


  def test
    render layout: 'home_test'
  end

  def map

  end


end
