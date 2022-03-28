class MailUsersController < ApplicationController
  
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = MailUser.all
  end

  def show
  end

  def new
    @user = MailUser.new
  end

  def edit
  end

  def create
    @user = MailUser.new(user_params) 
    if @user.save
      flash[:notice] = "created successfully"
      MailUsersMailer.with(user: @user).welcome_email.deliver_later
      redirect_to mail_user_path(@user)
    else
      #@user.errors.add(:picture, "can't be nil") if @user.picture.file.nil?
      flash[:errors] = @user.errors.full_messages
      redirect_to new_mail_user_path
    end
  end

  def update
    pre_email = @user.email
    if @user.update(user_params)
      MailUsersMailer.with(user: @user).update_email.deliver_later if pre_email != @user.email 
      flash[:notice] = "updated successfully"
      redirect_to mail_user_path(@user)
    else
      flash[:errors]=@user.errors.full_messages
      redirect_to edit_mail_user_path
    end
  end

  def destroy
    @id = @user.id
    @user.destroy
    @user.remove_picture = true 
    redirect_to mail_users_path
  end

  private
    def set_user
      @user = MailUser.find(params[:id])
    end
    
    def user_params
      params.require(:mail_user).permit(:name, :email, :picture) 
    end
end
