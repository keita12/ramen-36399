class Like < ApplicationRecord
	belongs_to :user
 	belongs_to :ramen

	validates :ramen_id, uniqueness: { scope: :user_id }
end
