class TopicsController < ApplicationController

	before_action :confirm_logged_in

	#READ ACTIONS
	def index
		@floor = Floor.find(params[:floor_id])
		@floor_id = params[:floor_id]
		@topics = @floor.topics
	end

	def show
		@topic = topic.find(params[:id])
	end

	# CREATE ACTIONS
	def new
		@topic = topic.new
		@floor_id = params[:floor_id]
	end

	def create
		@topic = topic.new(:title => params[:topic][:title], :message => params[:topic][:message], :floor_id => params[:floor_id])
		if @topic.save
			flash[:success] = "topic created successfully"
			redirect_to topics_path(floor_id: params[:floor_id])
		else
			flash[:danger].now = "topic couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@topic = topic.find(params[:id])
		@floor_id = params[:floor_id]
	end

	def update
		@topic = topic.find(params[:id])
		if @topic.update_attributes(topic_params)
			redirect_to topics_path(floor_id: params[:floor_id])
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@topic = topic.find(params[:id])
		@floor_id = params[:floor_id]
	end

	def destroy
		@topic = topic.find(params[:id])
		@topic.destroy
		flash[:success] = "topic '#{@topic.title}' deleted successfully."
		redirect_to topics_path(floor_id: params[:floor_id])
	end

	private

	def topic_params
		params.require(:topic).permit(:title, :message)
	end

end
