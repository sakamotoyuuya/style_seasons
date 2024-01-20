class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :cordinates, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :season_cordinates, dependent: :destroy
end
