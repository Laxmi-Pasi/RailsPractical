class MyuserController < ApplicationController
  include Devise::Controllers::Helpers 
  def home
    render :layout => 'admin' if current_myuser and current_myuser.role == 'admin'
    render :layout => 'merchant' if current_myuser and current_myuser.role == 'merchant'
  end

  
  # if current_myuser
  #   layout :users_layout
  # end
  # private
  #   def users_layout
  #     @current_myuser.role.admin? ? "admin" : "merchant"
  #   end
end
