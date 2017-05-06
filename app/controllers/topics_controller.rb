class TopicsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_regular

	# READ ACTIONS
	def index
		@floor = Floor.find(session[:floor_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @floor.tower.id != session[:tower_id]
			redirect_to topics_path
			return
		end
		############################################################
		############################################################
		@topics = @floor.topics.order('topics.created_at DESC')
	end

	def show
		@topic = Topic.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @topic.floor.tower.id != session[:tower_id]
			redirect_to topics_path
			return
		end
		############################################################
		############################################################
		@posts = @topic.posts.order('posts.created_at DESC')
		@post = Post.new
	end

	def add_post
		@topic = Topic.find(params[:topic_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @topic.floor.tower.id != session[:tower_id]
			redirect_to topics_path
			return
		end
		############################################################
		############################################################
		@post = Post.new(:message => params[:post][:message], :topic_id => @topic.id, :origin => session[:username])
		if @post.save
			redirect_to topic_path(@topic.id)
		else
			flash[:danger].now = "Post couldn't be created."
			render 'new'
		end
	end

	# CREATE ACTIONS
	def new
		@floor_id = session[:floor_id]
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(:title => params[:topic][:title], :message => params[:topic][:message], :floor_id => session[:floor_id], :origin => session[:username])
		if @topic.save
			flash[:success] = "Topic created successfully."
			redirect_to topics_path(floor_id: @topic.floor)
		else
			flash[:danger].now = "Topic couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@topic = Topic.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @topic.floor.tower.id != session[:tower_id]
			redirect_to topics_path
			return
		end
		############################################################
		############################################################
		@floor_id = @topic.floor.id
	end

	def update
		@topic = Topic.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @topic.floor.tower.id != session[:tower_id]
			redirect_to topics_path
			return
		end
		############################################################
		############################################################
		if @topic.update_attributes(topic_params)
			redirect_to topics_path(floor_id: @topic.floor)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@topic = Topic.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @topic.floor.tower.id != session[:tower_id]
			redirect_to topics_path
			return
		end
		############################################################
		############################################################
	end

	def destroy
		@topic = Topic.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @topic.floor.tower.id != session[:tower_id]
			redirect_to topics_path
			return
		end
		############################################################
		############################################################
		@topic.destroy
		flash[:success] = "Topic '#{@topic.title}' deleted successfully."
		redirect_to topics_path(floor_id: @topic.floor)
	end

	private

	def topic_params
		params.require(:topic).permit(:title, :message)
	end

end
