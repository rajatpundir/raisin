class TowersController < ApplicationController
	
	#READ ACTIONS
	def index
		@towers = Tower.all
	end

	def show
		@tower = Tower.find(params[:id])
	end

	# CREATE ACTIONS
	def new
		@tower = Tower.new
	end

	def create
		@tower = Tower.new(:towername => params[:tower][:towername], :password => params[:tower][:password])
		if @tower.save
			flash[:success] = "Tower created successfully"
			redirect_to(access_login_path)
		else
			flash[:danger].now = "Tower couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@tower = Tower.find(params[:id])
	end

	def update
		@tower = Tower.find(params[:id])
		if @tower.update_attributes(tower_params)
			redirect_to(access_login_path)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@tower = Tower.find(params[:id])
	end

	def destroy
		@tower = Tower.find(params[:id])
		@tower.destroy
		flash[:success] = "Tower '#{@tower.towername}' deleted successfully."
		redirect_to(access_login_path)
	end

	private

	def tower_params
		params.require(:tower).permit(:password)
	end

end
