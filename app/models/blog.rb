class Blog < ApplicationRecord
	extend FriendlyId
	acts_as_taggable
	friendly_id :title, use: [:slugged, :history]
	mount_uploader :blog_image, BlogImageUploader
	has_many :comments, dependent: :destroy
end
