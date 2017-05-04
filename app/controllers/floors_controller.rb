class FloorsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_administrator, :except => [:index, :show]

	#READ ACTIONS
	def index
		@floors = Floor.all
	end

	def show
		@floor = Floor.find(params[:id])
		@regulars = @floor.regulars
	end

	# CREATE ACTIONS
	def new
		@floor = Floor.new
	end

	def create
		@floor = Floor.new(:floorname => params[:floor][:floorname], :tower_id => session[:tower_id])
		if @floor.save
			flash[:success] = "Floor created successfully"
			redirect_to(floors_path)
		else
			flash[:danger].now = "Floor couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@floor = Floor.find(params[:id])
	end

	def update
		@floor = Floor.find(params[:id])
		if @floor.update_attributes(floor_params)
			redirect_to (floors_path)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@floor = Floor.find(params[:id])
	end

	def destroy
		@floor = Floor.find(params[:id])
		@floor.destroy
		flash[:success] = "Floor '#{@floor.floorname}' deleted successfully."
		redirect_to(floors_path)
	end

	private

	def floor_params
		params.require(:floor).permit(:floorname)
	end
	
end
