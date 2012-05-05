class Admin::RegionsController < Admin::DashboardController
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
    if region.save
      redirect_to admin_cities_path, :notice => 'region was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if region.update_attributes(params[:region])
      redirect_to admin_cities_path, :notice => 'region was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    region.destroy

    redirect_to admin_cities_path
  end

  def regions
    @regions ||= Region.all
  end
  helper_method :regions

  def root_regions
    @regions ||= Region.roots
  end
  helper_method :root_regions

  def region
    @region ||= if params[:id]
      Region.find params[:id]
    else
      Region.new params[:region]
    end
  end
  helper_method :region

end