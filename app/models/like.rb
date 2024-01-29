class Like < ApplicationRecord
  belongs_to :user
  belongs_to :cordinate

  validates :user_id, uniqueness: {scope: :cordinate_id}

end
