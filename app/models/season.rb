class Season < ApplicationRecord
  has_many :cordinates, dependent: :destroy
end
