class HomeController < ApplicationController
  def index
  end

  private

  def users
    @users = User.all.reverse
  end
  helper_method :users

  def schools
    @schools = School.all.size
  end
  helper_method :schools

end