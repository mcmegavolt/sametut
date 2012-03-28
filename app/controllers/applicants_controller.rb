class ApplicantsController < ApplicationController

  before_filter :require_user_or_admin!

  def index
  end

  def show
  end

  def new
    unless current_user.applicant
      applicant.build_profile
      applicant.social_activities.build
      applicant.work_experiences.build
      applicant.educations.build
    else
      flash[:error] = t(:'errors.messages.already_have_applicant')
      redirect_to edit_applicant_path(current_user.applicant)
    end
  end

  def edit
     unless applicant.user == current_user || admin_signed_in?
       flash[:error] = t(:'errors.messages.no_access')
       redirect_to root_url
     else
       applicant.build_profile unless applicant.profile
       applicant.social_activities.build unless applicant.social_activities
       applicant.work_experiences.build unless applicant.work_experiences
       applicant.educations.build unless applicant.educations
     end
  end

  def create
    applicant.user_id = current_user.id
    if applicant.save
       flash[:success] = t(:'site.user.edit_profile.profile_created')
       redirect_to root_url
     else
       render :action => "new"
     end
  end

  def update
     if applicant.update_attributes(params[:applicant])
       flash[:success] = t(:'site.user.edit_profile.profile_updated')
       redirect_to applicant_path
     else
       render :action => "edit"
     end
  end

  def destroy
     applicant.destroy
     redirect_to root_url
  end


end