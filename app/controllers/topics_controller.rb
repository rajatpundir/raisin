class TopicsController < ApplicationController

	before_action :confirm_logged_in

	#READ ACTIONS
	# def index
	# 	@floor = Floor.find(session[:floor_id])
	# 	@forum = @floor.forum
	# 	@topics = @forum.topics
	# end

	def show
		@topic = Topic.find(params[:id])
		@posts = @topic.posts
		@post = Post.new
	end

	def add_post
		@post = Post.new(:message => params[:post][:message], :topic_id => params[:topic_id])
		if @post.save
			flash[:success] = "Post added successfully."
			redirect_to topic_path(params[:topic_id])
		else
			flash[:danger].now = "Post couldn't be created."
			render 'new'
		end
	end

	# CREATE ACTIONS
	def new
		@floor = Floor.find(session[:floor_id])
		@topic = Topic.new
		@forum_id = @floor.forum.id
	end

	def create
		@topic = Topic.new(:title => params[:topic][:title], :forum_id => params[:forum_id])
		if @topic.save
			flash[:success] = "Topic created successfully."
			redirect_to forums_path(forum_id: @topic.forum)
		else
			flash[:danger].now = "Topic couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@topic = Topic.find(params[:id])
		@forum_id = @topic.forum.id
	end

	def update
		@topic = Topic.find(params[:id])
		if @topic.update_attributes(topic_params)
			redirect_to forums_path(forum_id: params[:forum_id])
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
		redirect_to forums_path(forum_id: params[:forum_id])
	end

	private

	def topic_params
		params.require(:topic).permit(:title)
	end

end
