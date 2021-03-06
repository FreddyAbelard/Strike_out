class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :strikers, foreign_key: :renter_id, dependent: :destroy
  has_many :bookings, foreign_key: :client_id, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  has_one_attached :photo
  # validates :photo, presence: true
end
