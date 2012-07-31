class Admin::SpecialtiesController < Admin::DashboardController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if specialty.save
      flash[:success] = t(:'admin.specialties.messages.created')
      redirect_to admin_specialties_path
    else
      render :action => "new"
    end
  end

  def update
    if specialty.update_attributes(params[:specialty])
      flash[:notice] = t(:'admin.specialties.messages.updated')
      redirect_to admin_specialties_path
    else
      render :action => "edit"
    end
  end

  def destroy
    specialty.destroy
    redirect_to admin_specialties_path
  end

  def specialties
    @specialties ||= Specialty.all
  end
  helper_method :specialties


  def specialty
    @specialty ||= if params[:id]
                              Specialty.find(params[:id])
                            else
                              Specialty.new(params[:specialty])
                            end
  end
  helper_method :specialty

end
