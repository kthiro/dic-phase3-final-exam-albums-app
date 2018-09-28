class Album < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  validates :image, presence: true
  validates :title, length: { maximum: 30 }
  validates :content, length: { maximum: 140 }
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
end
