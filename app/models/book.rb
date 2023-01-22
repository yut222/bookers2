class Book < ApplicationRecord
  has_one_attached :image  #user modelのみの記述でOK？
  belongs_to :user
  
    def get_image  #user modelのみの記述でOK？
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
    end
  
  has_many :favorite_users, through: :favorites, source: :user
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  
  
end