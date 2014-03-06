class WelcomeController < ApplicationController
  before_filter :disable_nav, only: [:index]

  def index
    redirect_to positions_path if user_signed_in?
  end

  def test
  end

  private
  
  def disable_nav
    @disable_nav = true 
  end


end