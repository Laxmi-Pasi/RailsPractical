class SessionsController < ApplicationController
  layout "user"
  def new
  end

  def create
    user=User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id]=user.id
      flash[:notice]="Logged in successfully"
      redirect_to user
    else
      flash[:notice]="invalid email or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id]=nil
    flash[:notice]="Logged out"
    redirect_to users_path
  end
end
