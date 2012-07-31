class HomeController < ApplicationController
  def index
  end

  private

  def users
    @users = User.all.reverse
  end
  helper_method :users

  def schools
    @schools = School.all
  end
  helper_method :schools

  def applicants
    @applicants = Applicant.all
  end
  helper_method :applicants

  def vacancies
    @vacancies = Vacancy.all
  end
  helper_method :vacancies


  def map
    @json = Location.all.to_gmaps4rails do |location, marker|
      marker.infowindow render_to_string(:partial => "shared/gmaps/info_window", :locals => { :school => School.find(location.addressable_id)})
      marker.title   ""
      marker.sidebar ""
      marker.json({ :id => location.id, :city => location.city })
    end
  end
  helper_method :map


end