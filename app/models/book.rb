class Book < ApplicationRecord
  has_one_attached :image  
  belongs_to :user
  
  
  
  has_many :favorite_users, through: :favorites, source: :user
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  
  
end