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

  #callback
  before_validation :normalize_name
  after_validation  :DOB_validated
  after_create  :show_create
  after_update  :show_update
  after_destroy :show_destroy
  after_save  :show_save
  after_commit :show_Email_validated
  private

  after_initialize do |faculty|
    puts "You have initialized faculty  object!"
  end

  after_find do |faculty|
    puts "You have found faculty  object!"
  end

  def normalize_name
    self.first_name = first_name.downcase.titleize
    self.last_name = last_name.downcase.titleize
  end

  def show_create 
    puts "record is successfully created."
  end

  def show_destroy
    puts "record is successfully deleted."
  end

  def show_update
    puts "record is successfully updated."
  end

  def show_save
    puts "your changes has been saved."
  end

  def DOB_validated
    puts "Your date of birth is validated."
  end

  def show_Email_validated
    puts "Email validated."
  end
end
