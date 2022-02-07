class Employee < ApplicationRecord
  validates :first_name, :last_name,:email,:age,:salary, presence: true
  validates :email, uniqueness: true
  validates :age,:no_of_order, numericality: { only_integer: true }
end
