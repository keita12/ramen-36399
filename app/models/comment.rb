class Comment < ApplicationRecord
	belongs_to :ramen
	belongs_to :user
	validates :text, presence: true
end
