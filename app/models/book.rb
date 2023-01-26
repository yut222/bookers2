class Book < ApplicationRecord

  belongs_to :user




  has_many :favorite_users, through: :favorites, source: :user
  has_many :book_comments, dependent: :destroy

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }


end