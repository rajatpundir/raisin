class TagsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_not_regular
	
	# READ ACTIONS
	def index
		@floor = Floor.find(params[:floor_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@floor_id = params[:floor_id]
		@tags = @floor.tags.order('tags.created_at DESC')
	end

	def show
		@tag = Tag.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @tag.floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
	end

	# CREATE ACTIONS
	def new
		@floor = Floor.find(params[:floor_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@floor_id = @floor.id
		@tag = Tag.new
	end

	def create
		@floor = Floor.find(params[:floor_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@tag = Tag.new(:title => params[:tag][:title], :message => params[:tag][:message], :floor_id => @floor.id, :origin => session[:username])
		if @tag.save
			flash[:success] = "Tag created successfully"
			redirect_to tags_path(floor_id: @floor.id)
		else
			flash[:danger].now = "Tag couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@floor = Floor.find(params[:floor_id])
		@tag = Tag.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @tag.floor.tower.id != session[:tower_id] or @tag.floor.id != @floor.id
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@floor_id = @floor.id
	end

	def update
		@tag = Tag.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @tag.floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		if @tag.update_attributes(tag_params)
			redirect_to tags_path(floor_id: @tag.floor.id)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@tag = Tag.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @tag.floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@floor_id = @tag.floor.id
	end

	def destroy
		@tag = Tag.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @tag.floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@tag.destroy
		flash[:success] = "Tag '#{@tag.title}' deleted successfully."
		redirect_to tags_path(floor_id: @tag.floor.id)
	end

	private

	def tag_params
		params.require(:tag).permit(:title, :message)
	end
	
end
