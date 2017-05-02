class TagsController < ApplicationController

	before_action :confirm_logged_in
	
	before_action :confirm_logged_in
	
	#READ ACTIONS
	def index
		@floor = Floor.find(params[:floor_id])
		@floor_id = params[:floor_id]
		@tags = @floor.tags
	end

	def show
		@tag = Tag.find(params[:id])
	end

	# CREATE ACTIONS
	def new
		@tag = Tag.new
		@floor_id = params[:floor_id]
	end

	def create
		@tag = Tag.new(:title => params[:tag][:title], :message => params[:tag][:message], :floor_id => params[:floor_id], :origin => session[:username])
		if @tag.save
			flash[:success] = "Tag created successfully"
			redirect_to tags_path(floor_id: params[:floor_id])
		else
			flash[:danger].now = "Tag couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@tag = Tag.find(params[:id])
		@floor_id = params[:floor_id]
	end

	def update
		@tag = Tag.find(params[:id])
		if @tag.update_attributes(tag_params)
			redirect_to tags_path(floor_id: params[:floor_id])
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@tag = Tag.find(params[:id])
		@floor_id = params[:floor_id]
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		flash[:success] = "Tag '#{@tag.title}' deleted successfully."
		redirect_to tags_path(floor_id: params[:floor_id])
	end

	private

	def tag_params
		params.require(:tag).permit(:title, :message)
	end
	
end
