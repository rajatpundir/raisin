class TopicsController < ApplicationController

	before_action :confirm_logged_in

	# READ ACTIONS
	def index
		@floor = Floor.find(session[:floor_id])
		@topics = @floor.topics.order('topics.created_at DESC')
	end

	def show
		@topic = Topic.find(params[:id])
		@posts = @topic.posts.order('posts.created_at DESC')
		@post = Post.new
	end

	def add_post
		@post = Post.new(:message => params[:post][:message], :topic_id => params[:topic_id], :origin => session[:username])
		if @post.save
			redirect_to topic_path(params[:topic_id])
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
		@floor_id = @topic.floor.id
	end

	def update
		@topic = Topic.find(params[:id])
		if @topic.update_attributes(topic_params)
			redirect_to topics_path(floor_id: @topic.floor)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@topic = Topic.find(params[:id])
	end

	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy
		flash[:success] = "Topic '#{@topic.title}' deleted successfully."
		redirect_to topics_path(floor_id: @topic.floor)
	end

	private

	def topic_params
		params.require(:topic).permit(:title, :message)
	end

end
