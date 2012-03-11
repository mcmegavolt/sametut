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


end
