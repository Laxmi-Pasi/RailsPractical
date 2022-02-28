class Myproduct < ApplicationRecord
  has_many :myorders, dependent: :destroy
  validates :name,:price, presence: true
end
