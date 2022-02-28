class Myorder < ApplicationRecord
  belongs_to :myproduct
  validates :quantity, :total_price, presence: true
end
