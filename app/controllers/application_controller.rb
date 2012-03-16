class ApplicationController < ActionController::Base
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


end
