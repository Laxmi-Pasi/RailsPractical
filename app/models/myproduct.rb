class Myproduct < ApplicationRecord
  #has_many :myorders, dependent: :destroy  //commented when you are using unit testing
  validates :name,:price, presence: true
  belongs_to :myuser
end
