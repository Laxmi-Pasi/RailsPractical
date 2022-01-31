class Book < ApplicationRecord
  belongs_to :author
  has_many :images
  after_destroy :log_destroy_action

  private
  def log_destroy_action
    puts 'Book destroyed'
  end
end
