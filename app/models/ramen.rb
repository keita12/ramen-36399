class Ramen < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_one_attached :image

	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :star
	validates :ramen_name,:image,:store_name,:star_id, presence: true
	validates :star_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
