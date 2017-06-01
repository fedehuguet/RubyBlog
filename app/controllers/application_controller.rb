class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :all_categories
  helper_method :all_posts
  before_filter :site_search

  def all_categories
  	@categories = Category.all
  end
  
  def all_posts
  	@posts = Post.all
  end

  def site_search
    @q = Post.ransack(params[:q])
    @search_posts = @q.result(distinct: true)
  end
end
