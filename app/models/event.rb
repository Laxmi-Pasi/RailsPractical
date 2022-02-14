class Event < ApplicationRecord
  belongs_to :user
  validates :name, :description, :event_date, presence: true
  validates :description, length: {minimum:6, maximum: 50}
  validates :event_date, comparison: {greater_than_or_equal_to: Date.today}
end
