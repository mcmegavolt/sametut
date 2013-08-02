class DepartmentsController < ApplicationController

  before_filter :require_user_or_admin!, :except => [:index, :show]

  def index
  end

  def show
  end

  def new
    unless current_user.department
      department.build_chief_profile
      department.build_location
    else
      flash[:error] = t(:'errors.messages.already_have_applicant')
      redirect_to edit_department_path(current_user.department)
    end
  end

  def edit
     unless department.user == current_user || admin_signed_in?
       flash[:error] = t(:'errors.messages.no_access')
       redirect_to root_url
     else
       
      department.build_chief_profile unless department.chief_profile
      
      if department.location
        gon.latitude = department.location.latitude
        gon.longitude = department.location.longitude
      else
        department.build_location 
        gon.latitude = 50.44405 
        gon.longitude = 30.52083
      end
        gon.map_zoom = 16
     end
  end

  def create
    department.user_id = current_user.id
    if department.save
       flash[:success] = t(:'site.user.edit_profile.profile_created')
       redirect_to department_path(department)
     else
       render :action => "new"
     end
  end

  def update
     if department.update_attributes(params[:department])
       flash[:success] = t(:'site.user.edit_profile.profile_updated')
       redirect_to department
     else
       render :action => "edit"
     end
  end

  def destroy
     department.destroy
     redirect_to root_url
  end

  def departments
    @departments ||= Department.page params[:page]
  end
  helper_method :departments

  def department
    @department ||= if params[:id]
      Department.find(params[:id])
    else
      Department.new(params[:department])
    end
  end
  helper_method :department


  def departments_count
    @departments_count = Department.count
  end
  helper_method :departments_count



end