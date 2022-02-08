class Employee < ApplicationRecord
  validates :first_name, :last_name,:email,:age,:salary, presence: true
  validates :email, uniqueness: true
  validates :age,:no_of_order, numericality: { only_integer: true }

  def self.increase_no_of_order
    Employee.find_in_batches(batch_size:10) do |emp|
      emp.each do |e|
        # print e.no_of_order
        e.no_of_order+=1
        e.save
        print e.no_of_order
      end
    end
  end

  def self.decrease_no_of_order
    Employee.find_in_batches(batch_size:10) do |emp|
      emp.each do |e|
        # print e.no_of_order
        e.no_of_order-=1
        e.save
        print e.no_of_order
      end
    end
  end

end
