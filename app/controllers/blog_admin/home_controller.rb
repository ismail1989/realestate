class BlogAdmin::HomeController < ApplicationController
	layout 'admin'

	def index
		@blog_count = Blog.all.count
  	@news_count = News.all.count
  	@blogs = Blog.all
  	@news = News.all
	end
end