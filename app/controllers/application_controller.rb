class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  protect_from_forgery








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


  # In the application controller
  protected
  def require_user_or_admin!
    unless user_signed_in? or admin_signed_in?
      flash[:error] = t(:'devise.failure.user.unauthenticated')
      redirect_to root_path
    end
  end


  after_filter :user_activity

  private

  def user_activity
    current_user.try :touch
  end


end
