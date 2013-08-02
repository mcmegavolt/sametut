class HomeController < ApplicationController
  def index
  end

  private

  def users
    @users = User.all.reverse
  end
  helper_method :users

  def schools_count
    @schools = School.count
  end
  helper_method :schools_count

  def departments_count
    @schools = Department.count
  end
  helper_method :departments_count

  def applicants_count
    @applicants = Applicant.count
  end
  helper_method :applicants_count

  def vacancies_count
    @vacancies = Vacancy.count
  end
  helper_method :vacancies_count


  def map
    @json = Location.where(:addressable_type => 'School').to_gmaps4rails do |location, marker|
      marker.infowindow render_to_string(:partial => "shared/gmaps/info_window", :locals => { :school => School.find(location.addressable_id)})
      marker.title   ""
      marker.sidebar ""
      marker.json({ :id => location.id, :city => location.city })
    end
  end
  helper_method :map


end