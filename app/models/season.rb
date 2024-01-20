class Season < ApplicationRecord
  has_many :season_cordinates, dependent: :destroy
end
