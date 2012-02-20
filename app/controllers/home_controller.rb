class HomeController < ApplicationController
  def index
  end

  private

  def users
    @users = User.all.reverse
  end
  helper_method :users

end