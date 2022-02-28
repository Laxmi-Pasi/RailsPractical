class Myuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:merchant, :admin]

  # before_save :set_default_role

  # def set_default_role
  #   self.role ||= role
  #   puts "-----------------#{:role}-------------"
  # end

end
