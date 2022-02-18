class FormHelperEmployee < ApplicationRecord
  validates :email, uniqueness: true
  validates :employee_name, :email, :mobile_number,:birth_date,:password,:gender,:address, presence: true
  validates :mobile_number, length: {minimum:10, maximum:11}
  validates :birth_date,  comparison: { less_than_or_equal_to: Date.today, message: "birthdate can't be in future"}
  has_many :emp_addresses, dependent: :destroy
  accepts_nested_attributes_for :emp_addresses, allow_destroy: true
  has_one_attached :document
end
