class Student < ApplicationRecord
  t=Time.new
  t1=t.strftime("%d/%m/%Y")
  validates   :first_name, :last_name, presence: true
  validate  :department_can_be_only_CE_or_IT
  validates :DOB, comparison: { less_than_or_equal_to: t1, message: " can't be in future"}
  validates :terms_of_service, acceptance: { message: 'You cannot proceed without accepting Terms of Usage' }
  
  #callback
  before_validation :normalize_name
  before_validation  :DOB_validated
  after_create  :show_create
  after_update  :show_update
  # after_destroy :show_destroy
  after_save  :show_save
  after_destroy :call_after_destroy_commit, if: after_destroy_commit

  def department_can_be_only_CE_or_IT
    if (department == "IT" || department == "CE")
    else
      errors.add(:department, "can't be #{department} ")
    end
  end

  private

  after_initialize do |student|
    puts "You have initialized student object!"
  end

  after_find do |student|
    puts "You have found student object!"
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
    puts "Your date of birth cannot be in future."
  end
  
  def destroy_student
    puts "student destroyed successfully"
  end
 
  def call_after_destroy_commit
    puts "this is the confirmation that your record is deleted."
  end
 
end
