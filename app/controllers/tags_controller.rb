class TagsController < ApplicationController

	before_action :confirm_logged_in
	
	#READ ACTIONS
	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	# CREATE ACTIONS
	def new
		@tag = Tag.new
	end

	def create
		@tag = Tag.new()
		if @tag.save
			flash[:success] = "Tag created successfully"
			redirect_to(tags_path)
		else
			flash[:danger].now = "Tag couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])
		if @tag.update_attributes(tag_params)
			redirect_to (tags_path)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		flash[:success] = "Tag '#{@tag.id}' deleted successfully."
		redirect_to(questions_path)
	end

	private

	def tag_params
		params.require(:tag).permit()
	end
	
end
