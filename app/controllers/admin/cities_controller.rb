class Admin::CitiesController < Admin::DashboardController
  layout 'admin'

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if city.save
      flash[:notice] = t(:'admin.city.create.success')
      redirect_to admin_cities_path
    else
      render :action => "new"
    end
  end

  def update
    if city.update_attributes(params[:city])
      flash[:notice] = t(:'admin.city.update.success')
      redirect_to admin_cities_path
    else
      render :action => "edit"
    end
  end

  def destroy
    category.destroy
    redirect_to admin_cities_path
  end

  def regions
    @regions ||= Region.all
  end
  helper_method :regions

  def city
    @city ||= if params[:id]
      City.find params[:id]
    else
      City.new params[:city]
    end
  end
  helper_method :city

end