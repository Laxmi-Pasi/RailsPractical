class User2 < ApplicationRecord
  #validates :first_name, :last_name, :email, presence: true
  #validate :authenticate, on: :update
  validate :check_previous_pw, on: :update_pw
  def authenticate
    u = User2.find_by_id(self.id)
    binding.pry
    if self.password != u.password
      errors.add(:base, "Previous password is incorrect.")
    end
  end

  def check_previous_pw
    u = User2.find_by_id(self.id)
    binding.pry
    
  end
end
