source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'
gem 'bootstrap-sass'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'devise'
gem 'cancancan', '~> 1.15'
gem 'mini_magick'
gem 'turbolinks', '~> 5'
gem 'carrierwave'
gem 'searchkick'
gem 'closure_tree'
gem 'jquery-datatables-rails', '~> 3.4'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'ckeditor'
gem 'kaminari'
gem 'friendly_id'
gem 'acts-as-taggable-on'
gem 'select2-rails'
gem 'tire'
gem 'font-awesome-sass'
gem 'capistrano-rails-console', require: false
gem 'pg'
gem 'toastr-rails'
gem 'owlcarousel-rails', '~> 1.1', '>= 1.1.3.3'
gem 'geocoder'
gem 'gmaps4rails'
# gem 'elasticsearch-model'
# gem 'elasticsearch-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'pry-rails'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "capistrano"
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]