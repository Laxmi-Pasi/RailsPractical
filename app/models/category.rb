class Category < ApplicationRecord
  has_many :events
  validates :category_name, uniqueness: true
end
