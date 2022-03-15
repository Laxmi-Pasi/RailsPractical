class User2sController < ApplicationController
  def index
    #binding.pry
    @users = User2.all
    @user = User2.new
  end

  def new
    @user = User2.new
  end

  def create
    @user = User2.new(user_params)
    # if @user.save
    #   flash[:notice]= "created"
    #   redirect_to user2_path(@user)
    # else
    #   flash[:errors] = @user.errors.full_messages
    #   redirect_to new_user2_path
    # end
    respond_to do |format|
      if @user.save
        #format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        #format.json { render :show, status: :created, location: @customer }
        format.js
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
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
    if @user.update(user_params)
      flash[:notice] = "updated successfully"
      redirect_to user2_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to profile_user2_path(@user)
    end
  end

  def change_password
  end

  def update_pw
    @user = User2.find(params[:id])
   #binding.pry
    if @user.update(password: params[:new_password],password_confirmation: params[:password_confirmation])
      flash[:notice] = "updated successfully"
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

    def pw_params
      params.require(:user2).permit(:password,:password_confirmation)
    end
end
