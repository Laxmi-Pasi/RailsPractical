class MyuserController < ApplicationController
  include Devise::Controllers::Helpers 
  def home
    if current_myuser and current_myuser.role == 'admin'
      render :layout => 'admin'
    elsif current_myuser and current_myuser.role == 'merchant'
      render :layout => 'merchant'
    else
    end
  end

  
  # if current_myuser
  #   layout :users_layout
  # end
  # private
  #   def users_layout
  #     @current_myuser.role.admin? ? "admin" : "merchant"
  #   end
end
