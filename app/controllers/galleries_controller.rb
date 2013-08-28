class GalleriesController < ApplicationController

  before_filter :require_user_or_admin!

  before_filter :require_owner, :only => [ :edit, :update, :destroy ]

  inherited_resources

  belongs_to :school, :department

  def create
    
    if current_user.school?
      gallery.galleryable = school
    elsif current_user.department?
      gallery.galleryable = department
    end
        
    if gallery.save
      flash[:success] = t(:'postings.create.success')
      # redirect_to galleryable_path(gallery.galleryable)
    else
      render :new
    end
  end

  def edit
    gallery.pictures.build if !gallery.pictures && gallery.pictures.size > 0
  end

  def update
    if gallery.update_attributes params[:gallery]
      flash[:success] = t(:'site.user.gallery.messages.updated')
      # redirect_to galleryable_path(gallery.galleryable)
    else
      flash[:success] = t(:'site.user.gallery.messages.error')
      render :edit
    end
  end

  def destroy
    gallery.destroy
    # redirect_to school_path(school)
  end

  private

  def galleries
    @galleries = Gallery.all
  end
  helper_method :galleries

  def gallery
    @gallery ||= if school.present?
      school.gallery || school.build_gallery
    elsif params[:id]
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
      unless current_user == gallery.galleryable.user
        flash[:error] = t('site.errors.access_denied')
        redirect_to root_path
      end
    end
  end

end
