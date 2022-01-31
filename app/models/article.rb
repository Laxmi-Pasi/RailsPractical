class Article < ApplicationRecord
  belongs_to :user, touch: true
  after_destroy :log_destroy_action

  private

  after_touch do
    puts 'An article was touched'
  end

  def log_destroy_action
    puts 'Article destroyed'
  end
  
end
