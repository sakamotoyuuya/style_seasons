class Item < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :cordinate
end
