class Admin::LocationsController < Admin::DashboardController
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
      redirect_to admin_locations_path, :notice => 'Location was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if city.update_attributes(params[:address_city])
      redirect_to admin_location_path, :notice => 'Location was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    category.destroy

    redirect_to admin_locations_path
  end

  def regions
    @regions ||= Address::Region.all
  end
  helper_method :regions

  def city
    @city ||= if params[:id]
      Address::City.find params[:id]
    else
      Address::City.new params[:address_city]
    end
  end
  helper_method :city

end