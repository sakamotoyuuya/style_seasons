class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :cordinates, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :season_cordinates, dependent: :destroy

  def customer_status
    if is_active == false
      "退会"
    else
      "有効"
    end
  end

  #退会したユーザーがログインできないようにする
  def active_for_authentication?
    super && (is_active == true)
  end
end
