class Admin::UserTypesController < Admin::DashboardController


  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if user_type.save
      flash[:notice] = 'User type was successfully created.'
      redirect_to admin_user_types_path
    else
      render :action => "new"
    end
  end

  def update
    if user_type.update_attributes(params[:user_type])
      flash[:notice] = 'User type was successfully updated.'
      redirect_to admin_user_types_path
    else
      render :action => "edit"
    end
  end

  def destroy
    user_type.destroy

    redirect_to admin_user_types_path
  end


  def user_types
    @users_types ||= UserType.all
  end
  helper_method :user_types


  def user_type
    @user_type ||= if params[:id]
      UserType.find(params[:id])
    else
      UserType.new(params[:user_type])
    end
  end
  helper_method :user_type






end
