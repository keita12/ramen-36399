class Comment < ApplicationRecord
	belongs_to :ramen
	belongs_to :user
end
