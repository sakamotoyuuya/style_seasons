class Cordinate < ApplicationRecord
   has_many :season_cordinates, dependent: :destroy
   has_many :items, dependent: :destroy
   belongs_to :user
   belongs_to :like
   belongs_to :review
end
