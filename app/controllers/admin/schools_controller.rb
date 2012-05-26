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
      flash[:success] = t(:'admin.schools.create_success')
      redirect_to admin_schools_path
    else
      render :action => "new"
    end
  end

  def update
    if school.update_attributes(params[:school])
      flash[:success] = t(:'admin.schools.update_success')
      redirect_to admin_schools_path
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
