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
      marker.infowindow render_to_string(:partial => "shared/gmaps/info_window", :locals => { :school => School.find(location.addressable_id)})
      marker.title   "i'm the title"
      marker.sidebar "i'm the sidebar"
      marker.json({ :id => location.id, :city => location.city })
    end
  end
  helper_method :map





end