class User < ApplicationRecord
  has_many :ramen
  has_many :likes
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  def liked_by?(ramen_id)
    likes.where(ramen_id: ramen_id).exists?
  end
end
