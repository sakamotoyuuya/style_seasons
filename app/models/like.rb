class Like < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :cordinate
end
