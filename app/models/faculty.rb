class Faculty < ApplicationRecord
  t=Time.new
  t1=t.strftime("%d/%m/%Y")
  validates :first_name, :last_name,:email_id, presence: true
  validates :email_id, uniqueness: true
  validate :desgination_of_faculty
  validates :DOB, comparison: { less_than_or_equal_to: t1, message: "birthdate can't be in future"}
  validates :phone, length: {is: 10},numericality: { only_integer: true }

  def desgination_of_faculty
    if (designation == "Ass. Prof" || designation == "Prof")
    elsif (designation == "HOD" || designation == "Sr. Prof.")
      errors.add(:designation, " must not be any from HOD and Sr. Prof.")
    else
      errors.add(:designation, "must  be any from Ass.Prof and Prof. ")
    end
  end
  
end
