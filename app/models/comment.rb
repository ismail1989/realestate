class Comment < ApplicationRecord
	acts_as_tree order: 'created_at DESC'
	
	belongs_to :blog
end
