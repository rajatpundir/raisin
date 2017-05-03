class GlobalTopicsController < ApplicationController

	before_action :confirm_logged_in

	#READ ACTIONS
	def index
		@tower = Tower.find(session[:tower_id])
		@global_topics = @tower.global_topics
	end

	def show
		@global_topic = GlobalTopic.find(params[:id])
		@global_posts = @global_topic.global_posts.order('global_posts.created_at DESC')
		@global_post = GlobalPost.new
	end

	def add_global_post
		@global_post = GlobalPost.new(:message => params[:global_post][:message], :global_topic_id => params[:global_topic_id], :origin => session[:username])
		if @global_post.save
			redirect_to global_topic_path(params[:global_topic_id])
		else
			flash[:danger].now = "Post couldn't be created."
			render 'new'
		end
	end

	# CREATE ACTIONS
	def new
		@tower_id = session[:tower_id]
		@global_topic = GlobalTopic.new
	end

	def create
		@global_topic = GlobalTopic.new(:title => params[:global_topic][:title], :message => params[:global_topic][:message], :tower_id => session[:tower_id], :origin => session[:username])
		if @global_topic.save
			flash[:success] = "Topic created successfully."
			redirect_to global_topics_path(tower_id: @global_topic.tower)
		else
			flash[:danger].now = "Topic couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@global_topic = GlobalTopic.find(params[:id])
		@tower_id = @global_topic.tower.id
	end

	def update
		@global_topic = GlobalTopic.find(params[:id])
		if @global_topic.update_attributes(global_topic_params)
			redirect_to global_topics_path(tower_id: @global_topic.tower)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@global_topic = GlobalTopic.find(params[:id])
	end

	def destroy
		@global_topic = GlobalTopic.find(params[:id])
		@global_topic.destroy
		flash[:success] = "Topic '#{@global_topic.title}' deleted successfully."
		redirect_to global_topics_path(tower_id: @global_topic.tower)
	end

	private

	def global_topic_params
		params.require(:global_topic).permit(:title, :message)
	end

end
