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
    render layout: 'application_test'
  end

  def map
    render layout: 'application_test2'
  end

  def starter
    render layout: 'home_starter'
  end


end
