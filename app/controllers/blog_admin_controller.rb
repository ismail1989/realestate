class BlogAdminController < ApplicationController
	layout 'admin'
  def index
  	@blogs = Blog.all
  	@news = News.all
  end

end
