class Admin::NewsItemsController < Admin::DashboardController

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    news_item.admin_id = current_admin.id
    if news_item.save
      flash[:notice] = 'News item was successfully created.'
      redirect_to admin_news_items_path
    else
      render :action => "new"
    end
  end

  def update
    if news_item.update_attributes(params[:news_item])
      flash[:notice] = 'News item was successfully updated.'
      redirect_to admin_news_items_path
    else
      render :action => "edit"
    end
  end

  def destroy
    news_item.destroy
    redirect_to admin_news_items_path
  end


  def news_items
    @news_item ||= NewsItem.all
  end
  helper_method :news_items


  def news_item
    @news_item ||= if params[:id]
      NewsItem.find(params[:id])
    else
      NewsItem.new(params[:news_item])
    end
  end
  helper_method :news_item


end
