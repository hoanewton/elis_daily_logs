class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @day = Day.find(params[:id])
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @user = current_user
    @event.user_id = @user.id
    @day = Day.find(params[:day_id]) 

    ordered_events = @day.events.sort_by  { |event| event.start_time }
    # @event = event

    if ordered_events != [] && @event.start_time > ordered_events.last.end_time
        @event.start_time = ordered_events.last.end_time
        flash[:notice] = "Start time of new Event just set to the last Event's end time"
      end

    # respond_to do |format|
      if @event.save
        @user.events << @event
        @day.events << @event 
        redirect_to day_path(@event.day_id)
        # format.html { redirect_to @event, notice: 'Event was successfully created.' }
        # format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        # format.json { render json: @event.errors, status: :unprocessable_entity }
      end

# Oder events logic
    
    for i in 0...(ordered_events.length - 1)
      if ordered_events[i].end_time != ordered_events[i+1].start_time
        flash[:notice] = "Automatic range to consecutive events!"
        # ordered_events[i+1].update({start_time: ordered_events[i].end_time})
      end
    end
    # end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    # respond_to do |format|
      if @event.update(event_params)
      	redirect_to day_path(@event.day_id)
        # format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        # format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        # format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    redirect_to day_path(@event.day_id)
    # respond_to do |format|
    #   format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_time, :end_time, :description, :comment)
    end
end
