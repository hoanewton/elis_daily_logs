class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]

  def search
    @baby = Baby.find(params[:baby_id])
    @days = @baby.days.search params[:search]
    @day = @days.find(params[:id])

    # @days = Day.search params[:search]
  end

  def email
    day = Day.find(params[:id])
    @baby = day.baby
    BabyParentMailer.daily_report_email(day).deliver
    redirect_to day_path(day)
  end

  def summary
    @day = Day.find(params[:id])
    @baby = @day.baby
  end

  # GET /days
  # GET /days.json
  def index
    @baby = Baby.find(params[:baby_id])
    @days = @baby.days
    @day = days.search(params[:search])
    redirect_to baby_path(@baby)
  end

  # GET /days/1
  # GET /days/1.json
  def show
    @day = Day.find(params[:id])
    @baby = @day.baby
    @events = @day.events
    @event = Event.new
  end

  # GET /days/new
  def new
    @baby = Baby.find(params[:baby_id])
    @day = Day.new
  end

  # GET /days/1/edit
  def edit
    @day = Day.find(params[:id])
    @baby = @day.baby
    @days = @baby.days
  end

  # POST /days
  # POST /days.json
  def create
    @user = current_user
    @baby = Baby.find(params[:baby_id])
    @day = Day.new(day_params)
    @day.baby_id = @baby.id
    @day.user_id = @user.id
    respond_to do |format|
      if @day.save
        @baby.days << @day
        @user.days << @day
        format.html { redirect_to baby_path(@baby), notice: 'Day was successfully created.' }
        # format.json { render :show, status: :created, location: @day }
      else
        format.html { render :new }
        # format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /days/1
  # PATCH/PUT /days/1.json
  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to @day, notice: 'Day was successfully updated.' }
        format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1
  # DELETE /days/1.json
  def destroy
    @day = Day.find(params[:id])
    @baby = @day.baby
    @day.destroy
    respond_to do |format|
      format.html { redirect_to baby_path(@baby), notice: 'Day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_params
      params.require(:day).permit(:date, :title, :status, :note)
    end
end
