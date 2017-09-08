class News < ApplicationRecord
	acts_as_taggable
  mount_uploader :news_image, NewsImageUploader
end
