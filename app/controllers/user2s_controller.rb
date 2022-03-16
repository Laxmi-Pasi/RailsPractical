class User2sController < ApplicationController
  def index
    @users = User2.all
    @user = User2.new
  end

  def new
    @user = User2.new
  end

  def create
    @user = User2.new(user_params)
    if @user.save
      flash[:notice]= "created"
      redirect_to user2_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user2_path
    end
  end

  def show
    @user = User2.find(params[:id])
  end

  def profile
    @user = User2.find(params[:id])
  end
  
  def update_profile
    @user = User2.find(params[:id])
    @previous = User2.find(params[:id])
    respond_to do |format|  
      if @user.update(user_params)
        flash.now[:notice] = "Profile updated successfully"
        format.js
      else
        flash.now[:errors] =  @user.errors.full_messages
        format.js
      end
    end
  end

  def change_password
    @pw = User2.find(params[:id])
  end

  def update_pw
    @user = User2.find(params[:id])
    if @user.update_attribute(:password,params[:new_password])
      flash[:notice] = "Password updated successfully"
      redirect_to user2_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to change_password_user2_path(@user)
    end
  end

  def destroy
    @user = User2.find(params[:id])
    @user.destroy
    redirect_to user2s_path
  end

  private
    def user_params
      params.require(:user2).permit(:first_name, :last_name,:email, :password, :subcription,:subscription_email,:password_confirmation)
    end
end
