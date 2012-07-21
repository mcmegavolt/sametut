class SchoolsController < ApplicationController

  before_filter :require_user_or_admin!

  def index
    respond_to do |format|
      format.html
      format.json {
        render :json => City.order(:name).tokens(params[:q]).as_json(:only => [:id, :name], :include => {:region => {:only => :name}})
      }
    end
  end

  def show
  end

  def new
    unless current_user.school
      school.build_director_profile
      school.build_location
    else
      flash[:error] = t(:'errors.messages.already_have_applicant')
      redirect_to edit_school_path(current_user.school)
    end
  end

  def edit
     unless school.user == current_user || admin_signed_in?
       flash[:error] = t(:'errors.messages.no_access')
       redirect_to root_url
     else
       school.build_director_profile unless school.director_profile
       school.build_location unless school.location
     end
  end

  def create
    school.user_id = current_user.id
    if school.save
       flash[:success] = t(:'site.user.edit_profile.profile_created')
       redirect_to root_url
     else
       render :action => "new"
     end
  end

  def update
     if school.update_attributes(params[:school])
       flash[:success] = t(:'site.user.edit_profile.profile_updated')
       redirect_to school
     else
       render :action => "edit"
     end
  end

  def destroy
     school.destroy
     redirect_to root_url
  end

  def schools
    @schools ||= School.all
  end
  helper_method :schools

  def school
    @school ||= if params[:id]
      School.find(params[:id])
    else
      School.new(params[:school])
    end
  end
  helper_method :school

end