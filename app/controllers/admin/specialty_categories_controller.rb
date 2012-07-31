class Admin::SpecialtyCategoriesController < Admin::DashboardController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if specialty_category.save
      flash[:success] = t(:'admin.specialty_categories.messages.created')
      redirect_to admin_specialty_categories_path
    else
      render :action => "new"
    end
  end

  def update
    if specialty_category.update_attributes(params[:specialty_category])
      flash[:notice] = t(:'admin.specialty_categories.messages.updated')
      redirect_to admin_specialty_categories_path
    else
      render :action => "edit"
    end
  end

  def destroy
    specialty_category.destroy
    redirect_to admin_specialty_categories_path
  end

  def specialty_categories
    @specialty_categories ||= SpecialtyCategory.all
  end
  helper_method :specialty_categories


  def specialty_category
    @specialty_category ||= if params[:id]
      SpecialtyCategory.find(params[:id])
    else
      SpecialtyCategory.new(params[:specialty_category])
    end
  end
  helper_method :specialty_category

end
