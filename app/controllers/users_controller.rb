class UsersController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @user=User.new
    @user.avatar.attach(params[:avatar])
    #@user.avatar.attach(io: File.open('app/assets/images/placeholder.png'), filename: 'placeholder.png', content_type: 'image/png')
  end

  def show
  end
end
