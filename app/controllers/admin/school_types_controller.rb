class Admin::SchoolTypesController < ApplicationController

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
    if school_type.save
      redirect_to admin_school_types_path, :notice => 'School type was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if school_type.update_attributes(params[:education_school_type])
      redirect_to admin_school_types_path, :notice => 'School type was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    school_type.destroy

    redirect_to admin_school_types_path
  end


  def school_types
    @school_types ||= EducationSchoolType.all
  end
  helper_method :school_types


  def school_type
    @school_type ||= if params[:id]
      EducationSchoolType.find(params[:id])
    else
      EducationSchoolType.new(params[:school_type])
    end
  end
  helper_method :school_type

end
