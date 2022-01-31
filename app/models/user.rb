class User < ApplicationRecord
  has_one_attached :avatar
  has_many  :articles, dependent: :destroy
  after_touch :log_when_users_or_articles_touched
  
  before_validation :normalize_name
  before_validation :remove_whitespaces
  before_create :add_create_date
  before_update :add_update_date
  before_save :password, if: :email?
  
  #validations
  validates :name, length: { maximum: 6 }
  validates :email, presence: true
  
  #----------------------------------------------------------
  
  after_validation :assign_login_value
  after_destroy :show_destroy_msg
  
  private

  after_initialize do |user|
    puts "You have initialized an object!"
  end

  after_find do |user|
    puts "You have found an object!"
  end

  after_touch do |user|
    puts "You have touched an object"
  end

  def normalize_name
    self.name = name.downcase.titleize
  end

  def remove_whitespaces
    name.strip!
  end

  def assign_login_value
    if email
      self.login=email
    end
  end

  def add_create_date
    self.create_date=Date.today
  end

  def add_update_date
    self.update_date=Date.today
  end

  def show_destroy_msg
    puts "record has been deleted"
  end

  def log_when_users_or_articles_touched
    puts 'User/artciles was touched'
  end

end
