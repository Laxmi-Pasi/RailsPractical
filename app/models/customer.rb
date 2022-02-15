class Customer < ApplicationRecord
  validates :email, uniqueness: true
  validates :fname, :lname, :email, :phone_number, presence: true
  validates :phone_number, length: {minimum:10, maximum:11}
  has_many  :orders, dependent: :destroy
end
