class MyuserController < ApplicationController
  include Devise::Controllers::Helpers 
  def home
    render :layout => 'admin' if current_myuser and current_myuser.role == 'admin'
    render :layout => 'merchant' if current_myuser and current_myuser.role == 'merchant'
  end
end
