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


  def regions
    @regions ||= Region.all
  end
  helper_method :regions


  protected

  def require_user_or_admin!
    unless user_signed_in? or admin_signed_in?
      flash[:error] = t(:'devise.failure.user.unauthenticated')
      redirect_to root_path
    end
  end

  def news_items
    @news_items = NewsItem.order('created_at DESC')
  end
  helper_method :news_items


  after_filter :user_activity

  private

  def user_activity
    current_user.try :touch
  end


end
