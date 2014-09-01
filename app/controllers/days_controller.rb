class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]

  # GET /days
  # GET /days.json
  def index
    @baby = Baby.find(params[:baby_id])
    @days = @baby.days
    redirect_to baby_path(@baby)
  end

  # GET /days/1
  # GET /days/1.json
  def show
    @day = Day.find(params[:id])
    @baby = @day.baby
    @events = @day.events
  end

  # GET /days/new
  def new
    @baby = Baby.find(params[:baby_id])
    @day = Day.new
  end

  # GET /days/1/edit
  def edit
     @day = Day.find(params[:id])
     # @baby = @day.baby
  end

  # POST /days
  # POST /days.json
  def create
    @baby = Baby.find(params[:baby_id])
    @day = Day.new(day_params)
    @day.baby_id = @baby.id
    respond_to do |format|
      if @day.save
        format.html { redirect_to baby_path(@baby), notice: 'Day was successfully created.' }
        format.json { render :show, status: :created, location: @day }
      else
        format.html { render :new }
        format.json { render json: @day.errors, status: :unprocessable_entity }
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
    @day.destroy
    respond_to do |format|
      format.html { redirect_to days_url, notice: 'Day was successfully destroyed.' }
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
