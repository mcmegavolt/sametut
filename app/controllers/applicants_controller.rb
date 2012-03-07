class ApplicantsController < ApplicationController

  before_filter :authenticate_user!


  def index
  end

  def show
  end

  def new
    applicant.build_profile
    applicant.social_activities.build
    applicant.work_experiences.build
    applicant.educations.build
  end

  def edit

     unless applicant.user == current_user
        redirect_to root_url, :notice => 'You dont have access to this page.'
     end


     applicant.build_profile unless applicant.profile
     applicant.social_activities.build
     applicant.work_experiences.build
     applicant.educations.build



  end

  def create
    applicant.user_id = current_user.id
    if applicant.save
       redirect_to root_url, :notice => 'Profile was successfully created.'
     else
       render :action => "new"
     end
  end

  def update
     if applicant.update_attributes(params[:applicant])
       redirect_to root_url, :notice => 'Profile was successfully created.'
     else
       render :action => "edit"
     end
  end

  def destroy
     applicant.destroy
     redirect_to root_url
  end

  def applicants
    @applicants ||= Applicant.all
  end
  helper_method :applicants

  def applicant
    @applicant ||= if params[:id]
      Applicant.find(params[:id])
    else
      Applicant.new(params[:applicant])
    end
  end
  helper_method :applicant

end