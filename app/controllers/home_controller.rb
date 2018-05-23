class HomeController < ApplicationController
  def index; end

  def contacts
    @user = User.new
  end
end
