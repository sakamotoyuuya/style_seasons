class CordinateItem < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :cordinate
end
