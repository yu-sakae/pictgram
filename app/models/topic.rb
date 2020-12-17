class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end
  
  has_many :comments
end