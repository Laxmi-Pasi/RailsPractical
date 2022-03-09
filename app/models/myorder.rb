class Myorder < ApplicationRecord
  belongs_to :myproduct
  validates :quantity, presence: true
  before_save :add_total_price

  private
    def add_total_price
      product_price=Myproduct.where("id = ?",myproduct_id).pluck(:price)
      self.total_price=product_price[0] * quantity
    end
end
