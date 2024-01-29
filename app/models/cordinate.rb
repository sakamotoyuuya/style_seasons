class Cordinate < ApplicationRecord
   has_many :cordinate_items, dependent: :destroy
   has_many :items, through: :cordinate_items
   has_many :likes, dependent: :destroy
   belongs_to :admin
   belongs_to :season

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

   has_one_attached :image
  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize: "#{width}x#{height}!").processed
  end
end
