class ApplicantsController < ApplicationController
  # GET /applicants
  # GET /applicants.json
  def index
  end

  def show
  end

  def new
   # applicant.build_profile
  end

  def edit
  end

  def create

    if applicant.save
      redirect_to applicant, :notice => 'Applicant was successfully created.'
    else
      render :action => "new"
    end
    p "category.errors #{applicant.errors.inspect}"

  end


  def update

    if applicant.update_attributes(params[:applicant])
      redirect_to @applicant, :notice => 'Applicant was successfully updated.'
    else
      render :action => "edit"
    end

  end


  def destroy

    applicant.destroy

    redirect_to applicants_path

  end

  private

  def applicant

    @applicant = if params[:id]
      Applicant.find(params[:id])
    else
      Applicant.new(params[:applicant])
    end

    @applicant.build_profile

  end
  helper_method :applicant

  def applicants

    @applicants = Applicant.all

  end
  helper_method :applicants



end
