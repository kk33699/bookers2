class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  has_one_attached :image

  validates :introduction,  length: { maximum: 500 }, allow_blank: true

end
