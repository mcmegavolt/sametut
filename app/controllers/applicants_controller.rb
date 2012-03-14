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
      redirect_to edit_applicant_path(current_user.applicant), :notice => t(:'errors.messages.already_have_applicant')
    end
  end

  def edit
     unless applicant.user == current_user || admin_signed_in?
        redirect_to root_url, :notice => t(:'errors.messages.no_access')
     else
       applicant.build_profile unless applicant.profile
       applicant.social_activities.build
       applicant.work_experiences.build
       applicant.educations.build
     end
  end

  def create
    applicant.user_id = current_user.id
    if applicant.save
       redirect_to root_url, :notice => t(:'site.user.edit_profile.profile_created')
     else
       render :action => "new"
     end
  end

  def update
     if applicant.update_attributes(params[:applicant])
       redirect_to root_url, :notice => t(:'site.user.edit_profile.profile_updated')
     else
       render :action => "edit"
     end
  end

  def destroy
     applicant.destroy
     redirect_to root_url
  end



end