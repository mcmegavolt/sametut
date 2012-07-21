class GalleriesController < ApplicationController

  before_filter :require_user_or_admin!

  before_filter :require_owner, :only => [ :edit, :update, :destroy ]

  def index
  end

  def show
  end

  def new
    gallery.images.build
  end

  def create
    gallery.school = school
    if gallery.save
      flash[:success] = t(:'postings.create.success')
      #NotificationMailer.posting_created(posting).deliver
      redirect_to gallery_path(gallery)
    else
      render :new
    end
  end

  def edit
    #@posting = current_user.postings.find(params[:posting])
    #posting.images.build unless posting.images.size > 0
  end

  def update
    if gallery.update_attributes params[:gallery]
      flash[:notice] = t(:'postings.update.success')
      redirect_to gallery_path(gallery)
    else
      render :new
    end
  end

  def destroy
    gallery.destroy
    redirect_to school_path(school)
  end

  private

  def galleries
    @galleries ||= if school.present?
      school.galleries
    else
      Gallery
    end
  end
  helper_method :galleries

  def gallery
    @gallery ||= if params[:id]
      Gallery.find params[:id]
    else
      Gallery.new params[:gallery]
    end
  end
  helper_method :gallery

  def school
    @school ||= School.find params[:school_id] if params[:school_id]
  end
  helper_method :school

  def require_owner
    unless admin_signed_in?
      unless current_user == gallery.school.user
        flash[:error] = t('site.errors.access_denied')
        redirect_to root_path
      end
    end
  end

end
