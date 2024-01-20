class SeasonCordinate < ApplicationRecord
  belongs_to :user
  belongs_to :season
  belongs_to :cordinate
end
