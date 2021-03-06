class ModeratorTopicsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_administrator

	# READ ACTIONS
	def index
		@tower = Tower.find(session[:tower_id])
		@moderator_topics = @tower.moderator_topics.order('moderator_topics.created_at DESC')
	end

	def show
		@moderator_topic = ModeratorTopic.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator_topic.tower.id != session[:tower_id]
			redirect_to moderator_topics_path
			return
		end
		############################################################
		############################################################
		@moderator_posts = @moderator_topic.moderator_posts.order('moderator_posts.created_at DESC')
		@moderator_post = ModeratorPost.new
	end

	def add_moderator_post
		@moderator_topic = ModeratorTopic.find(params[:moderator_topic_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator_topic.tower.id != session[:tower_id]
			redirect_to moderator_topics_path
			return
		end
		############################################################
		############################################################
		@moderator_post = ModeratorPost.new(:message => params[:moderator_post][:message], :moderator_topic_id => @moderator_topic.id, :origin => session[:username])
		if @moderator_post.save
			redirect_to moderator_topic_path(@moderator_topic.id)
		else
			flash[:danger].now = "Post couldn't be created."
			render 'new'
		end
	end

	# CREATE ACTIONS
	def new
		@moderator_topic = ModeratorTopic.new
	end

	def create
		@moderator_topic = ModeratorTopic.new(:title => params[:moderator_topic][:title], :message => params[:moderator_topic][:message], :tower_id => session[:tower_id], :origin => session[:username])
		if @moderator_topic.save
			flash[:success] = "Topic created successfully."
			redirect_to moderator_topics_path(tower_id: @moderator_topic.tower)
		else
			flash[:danger].now = "Topic couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@moderator_topic = ModeratorTopic.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator_topic.tower.id != session[:tower_id]
			redirect_to moderator_topics_path
			return
		end
		############################################################
		############################################################
	end

	def update
		@moderator_topic = ModeratorTopic.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator_topic.tower.id != session[:tower_id]
			redirect_to moderator_topics_path
			return
		end
		############################################################
		############################################################
		if @moderator_topic.update_attributes(moderator_topic_params)
			redirect_to moderator_topics_path(tower_id: @moderator_topic.tower)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@moderator_topic = ModeratorTopic.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator_topic.tower.id != session[:tower_id]
			redirect_to moderator_topics_path
			return
		end
		############################################################
		############################################################
	end

	def destroy
		@moderator_topic = ModeratorTopic.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @moderator_topic.tower.id != session[:tower_id]
			redirect_to moderator_topics_path
			return
		end
		############################################################
		############################################################
		@moderator_topic.destroy
		flash[:success] = "Topic '#{@moderator_topic.title}' deleted successfully."
		redirect_to moderator_topics_path(tower_id: @moderator_topic.tower)
	end

	private

	def moderator_topic_params
		params.require(:moderator_topic).permit(:title, :message)
	end
	
end
