class Admin::SchoolsController < Admin::DashboardController
  layout 'admin'

  def index
  end

  def show
  end

  def new
    school.build_location
  end

  def edit
  end

  def create
    if school.save
      redirect_to admin_schools_path, :notice => 'School was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if school.update_attributes(params[:school])
      redirect_to admin_schools_path, :notice => 'School was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    school.destroy

    redirect_to admin_schools_path
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
