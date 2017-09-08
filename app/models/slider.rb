class Slider < ApplicationRecord
	mount_uploaders :slider, SliderUploader
	serialize :slider, JSON
end
