class TopicsController < ApplicationController

  before_action :set_sidebar_topics

	layout 'blog'

  def index
  	@page_title = "Topics | My Portfolio Blog"
  	@topics = Topic.all
  end

  def show
  	@topic = Topic.find(params[:id])
  	@page_title = @topic.title
  	if logged_in?(:site_admin)
  		@blogs = @topic.blogs.recent.page(params[:page]).per(4)
  	else
  		@blogs = @topic.blogs.published.recent.page(params[:page]).per(4)
  	end
  end

  private

  def set_sidebar_topics
    @sidebar_topics = Topic.has_blogs
  end
end
