class PagesController < ApplicationController
  def home
  	@blogs = Blog.all
  end

  def contact
  end

  def about
  end
end
