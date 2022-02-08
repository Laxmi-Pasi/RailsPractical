class Book < ApplicationRecord
  belongs_to :author
  has_many :images
<<<<<<< HEAD
  # attr_accessible :lock_version, :name, :price, :author_id
  # def update_with_conflict_validation(*args)
  #   # @book.update(*args)
  # rescue ActiveRecord::Locking
  #   errors.add :base, "This record." 
  #   false
  # end
  scope :costs_more_than, ->(amount) { where("price > ?", amount) }
=======
>>>>>>> d624882100b8bd72346d3bce20bac6fb96d2a722
end
