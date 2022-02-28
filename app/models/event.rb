class Event < ApplicationRecord
  #belongs_to :user
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :events_users
  has_many :users, through: :events_users

  validates :name, :description, :event_date, presence: true
  validates :description, length: {minimum:6, maximum: 50}
  validates :event_date, comparison: {greater_than_or_equal_to: Date.today} 
end
