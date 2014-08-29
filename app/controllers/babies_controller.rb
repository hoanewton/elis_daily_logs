class BabiesController < ApplicationController

	def index
		@babies = Baby.all
	end

	def new
		@baby = Baby.new
	end

	def create
  	@baby = Baby.new(baby_params)
  	# user = session[:current_user]
  	if @baby.save
  		@baby.users << current_user
  		redirect_to babies_path
  	else
  		render :new
  	end
	end	

	def show
		@baby = Baby.find(params[:id])
		# @days = @baby.days
		# @day = Day.new
	end

	def edit
		@baby = Baby.find(params[:id])
	end

	def update
    @baby = Baby.find(params[:id])
    if @baby.update(baby_params)
      redirect_to babies_path
    else
      render :edit
    end
  end

	def destroy
		@baby = Baby.find(params[:id])
		@baby.destroy
		redirect_to babies_path
	end



	private

	def baby_params
	  params.require(:baby).permit(:photo, :first_name, :last_name, :gender, :age, :parent_name, :parent_email, :nanny_name, :nanny_email, :special_condition )
	end

end
