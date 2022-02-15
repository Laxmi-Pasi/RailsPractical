# class Student   
#   attr_accessor :first_name, :last_name, :email, :username, :password #setter method by default

#   def initialize(firstname, lastname, username, email, password)
#     @first_name = firstname
#     @last_name = lastname
#     @username = username
#     @email = email
#     @password = password
#   end
   
#   def to_s
#     "First name: #{@first_name}, Last name: #{@last_name}, Username: #{@username},email address: #{@email}"
#   end
   
# end
   
# mashrur = Student.new("Mashrur", "Hossain", "mashrur1", "mashrur@example.com","password1")
# john = Student.new("John", "Doe", "john1", "john1@example.com","password2")
# puts mashrur
# puts john
# mashrur.last_name = john.last_name
# puts "Mashrur is altered"
# puts mashrur

require 'bcrypt'

my_password = BCrypt::Password.create("my password")
puts my_password                 
puts my_password == "my password"     
puts my_password == "not my password" 

my_password = BCrypt::Password.new(my_password)
puts my_password == "my password"     #=> true
puts my_password == "not my password" #=> false

