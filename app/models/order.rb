class Order < ApplicationRecord
  belongs_to :customer 
  belongs_to :product
  enum :status, [:booked, :cancelled]

  private
    before_create :add_total_price

    def add_total_price
      product_price=Product.where("id = ?",product_id).pluck(:price)
      self.total_price=product_price[0] * quantity
    end
end
