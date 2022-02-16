class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # before_action :add_user_id_into_events_table, only: %i[create]

  # def add_user_id_into_events_table
  #   self.user_id=current_user
  # end

  def index
    @events = Event.order(event_date: :desc)
    @events=Event.where('category_id=?',params[:search]) if params[:search]
    puts session[:user_id]
  end
  def show
  end

  def new
    @event=Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    #@event.user = current_user  //this works when we have 1 to many relation between user and events
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    if logged_in?
      redirect_to user_path
    else
      redirect_to events_path
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description,  :event_date, :category_id)
    end

end