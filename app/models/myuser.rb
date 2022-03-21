class Myuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :myproducts, :dependent => :destroy

  validates :role, presence: true

  #enum role: [:merchant, :admin]
end
