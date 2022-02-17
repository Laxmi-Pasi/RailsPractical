class UsersController < ApplicationController
  def show
    @user=User.find(session[:user_id])
    if session[:user_id] && params[:event_id]
      EventsUser.create(user_id:session[:user_id],event_id:params[:event_id])  
    end
  end

  def user_events
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id]=@user.id
        format.html { redirect_to user_url(@user), notice: "#{@user.username} was successfully signup in." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        redirect_to articles_path 
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
