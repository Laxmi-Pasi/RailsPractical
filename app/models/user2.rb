class User2 < ApplicationRecord
  #validates :first_name, :last_name, :email, presence: true
  validate :authenticate, on: :update
  #validate :check_previous_pw, on: :update_pw
  def authenticate
    u = User2.find_by_id(self.id)
    if ((self.password != u.password) && (self.email != u.email))
      errors.add(:base, "Previous password is incorrect.")
    else
      self.password = u.password
    end
  end
end
