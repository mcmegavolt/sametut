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


  def map
    @json = Location.all.to_gmaps4rails do |location, marker|
      marker.json({ :id => location.id, :type => location.addressable_type })
    end
  end
  helper_method :map





end