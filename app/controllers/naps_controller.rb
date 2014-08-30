class NapsController < ApplicationController
	before_action :set_nap, only: [:index, :create, :edit, :update, :destroy]
	# GET /naps
  # GET /naps.json
  def index
  	@nap = Nap.find(params[:id])
  	@day = @nap.day
    @naps = @day.naps
  end

  # GET /naps/1
  # GET /naps/1.json
  # def show
  # end

  # GET /naps/new
  def new
  	@baby = Baby.find(params[:baby_id])
    @day = Day.find(params[:day_id])
    @nap = Nap.new
  end

  # GET /naps/1/edit
  # def edit
  # end

  # # POST /naps
  # # POST /naps.json
  # def create
  #   @nap = Nap.new(nap_params)

  #   # respond_to do |format|
  #     if @nap.save

  #       day = Day.find(params[:day_id])
  #       day.naps << @nap 
  #       redirect_to day_path(@nap.day_id)
  #       # format.html { redirect_to @nap, notice: 'nap was successfully created.' }
  #     #   # format.json { render :show, status: :created, location: @nap }
  #     # else
  #     #   format.html { render :new }
  #     #   format.json { render json: @nap.errors, status: :unprocessable_entity }
  #     end
  #   # end
  # end

  # # PATCH/PUT /naps/1
  # # PATCH/PUT /naps/1.json
  # def update
  #   respond_to do |format|
  #     if @nap.update(nap_params)
  #       format.html { redirect_to @nap, notice: 'nap was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @nap }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @nap.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /naps/1
  # DELETE /naps/1.json
  def destroy
    @nap.destroy
    redirect_to day_path(@nap.day_id)
    # respond_to do |format|
      # format.html { redirect_to naps_url, notice: 'nap was successfully destroyed.' }
      # format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nap
      @nap = Nap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nap_params
      params.require(:nap).permit(:start_time, :end_time, :description)
    end

end