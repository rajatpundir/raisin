class RegularsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_administrator
	
	#READ ACTIONS
	def index
		@regulars = Regular.all
	end

	def show
		@regular = Regular.find(params[:id])
	end

	# CREATE ACTIONS
	def new
		@regular = Regular.new
		@floor_id = params[:floor_id]
	end

	def create
		@regular = Regular.new(:username => params[:regular][:username], :password => params[:regular][:password], :first_name => params[:regular][:first_name], :last_name => params[:regular][:last_name], :floor_id => params[:floor_id])
		if @regular.save
			flash[:success] = "Regular created successfully."
			redirect_to(floor_path(params[:floor_id]))
		else
			flash[:danger].now = "Regular couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@regular = Regular.find(params[:id])
	end

	def update
		@regular = Regular.find(params[:id])
		if @regular.update_attributes(regular_params)
			redirect_to (regulars_path)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@regular = Regular.find(params[:id])
	end

	def destroy
		@regular = Regular.find(params[:id])
		@regular.destroy
		flash[:success] = "Regular '#{@regular.username}' deleted successfully."
		redirect_to(regulars_path)
	end

	private

	def regular_params
		params.require(:regular).permit(:first_name, :last_name, :password)
	end

end
