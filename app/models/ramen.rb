class Ramen < ApplicationRecord
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_one_attached :image
	def self.search(search)
    if search != ""
      Ramen.where('store_name LIKE(?)', "%#{search}%")
			Ramen.where('ramen_name LIKE(?)', "%#{search}%")
    else
      Ramen.all
    end
  end
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :star
	validates :ramen_name,:image,:store_name,:star_id, presence: true
	validates :star_id, numericality: { other_than: 1 , message: "を入力してください"} 
end
