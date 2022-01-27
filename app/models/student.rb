class Student < ApplicationRecord
    t=Time.new
    t1=t.strftime("%d/%m/%Y")
    validates   :first_name, :last_name, presence: true, on: :create
    validate  :department_can_be_only_CE_or_IT
    validates :DOB, comparison: { less_than_or_equal_to: t1, message: " can't be in future"}
    validates :terms_of_service, acceptance: { message: 'You cannot proceed without accepting Terms of Usage' }
    def department_can_be_only_CE_or_IT
        if (department == "IT" || department == "CE")
        else
            errors.add(:department, "department can't be ")
        end
    end
end
