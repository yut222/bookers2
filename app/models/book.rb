class Book < ApplicationRecord
  has_one_attached :image  #user modelのみの記述でOK？
  belongs_to :user

    def get_profile_image(width, height)  #user modelのみの記述でOK？
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
    end


  has_many :favorite_users, through: :favorites, source: :user
  has_many :book_comments, dependent: :destroy

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }


end