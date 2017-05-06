class PollsController < ApplicationController

	before_action :confirm_logged_in
	before_action :is_regular

	# READ ACTIONS
	def index
		@floor = Floor.find(session[:floor_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @floor.tower.id != session[:tower_id]
			redirect_to polls_path
			return
		end
		############################################################
		############################################################
		@floor_id = @floor.id
		@polls = @floor.polls.order('polls.created_at DESC')
	end

	def show
		@poll = Poll.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @poll.floor.tower.id != session[:tower_id]
			redirect_to polls_path
			return
		end
		############################################################
		############################################################
	end

	def add_option
		@poll = Poll.find(params[:poll_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @poll.floor.tower.id != session[:tower_id]
			redirect_to polls_path
			return
		end
		############################################################
		############################################################
		@option = Option.new(:message => params[:option][:message], :poll_id => @poll.id)
		if @option.save
			redirect_to edit_poll_path(@poll.id)
		else
			flash[:danger].now = "Option couldn't be created."
			render 'new'
		end
	end

	def delete_option
		@option = Option.find(params[:format])
		############################################################
		############SECURITY#########CHECK##########################
		if @option.poll.floor.tower.id != session[:tower_id]
			redirect_to polls_path
			return
		end
		############################################################
		############################################################
		@option.destroy
		flash[:success] = "Option deleted successfully."
		redirect_to edit_poll_path(@option.poll)
	end

	def vote
		@poll = Poll.find(params[:poll_id])
		############################################################
		############SECURITY#########CHECK##########################
		if @poll.floor.tower.id != session[:tower_id]
			redirect_to polls_path
			return
		end
		############################################################
		############################################################
		@options = @poll.options
		@options.each do |option|
			@voters = option.voters
			@voters.each do |voter|
				if voter.username == session[:username]
					voter.destroy
				end
			end
		end
		@options.each do |option|
			if option.message == params[:option]
				@voter = Voter.new(:username => session[:username], :option_id => option.id)
				if @voter.save
					flash[:success] = "You have successfully voted!"
					redirect_to poll_path(@poll.id)
				else
					flash[:danger].now = "Sorry, your vote couldn't be registered!"
					render 'new'
				end
				break
			end
		end
	end

	# CREATE ACTIONS
	def new
		@poll = Poll.new
		@floor_id = session[:floor_id]
	end

	def create
		@poll = Poll.new(:title => params[:poll][:title], :message => params[:poll][:message], :floor_id => session[:floor_id], :origin => session[:username])
		if @poll.save
			flash[:success] = "Poll created successfully"
			redirect_to polls_path(floor_id: session[:floor_id])
		else
			flash[:danger].now = "Poll couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@poll = Poll.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @poll.floor.tower.id != session[:tower_id]
			redirect_to polls_path
			return
		end
		############################################################
		############################################################
		@option = Option.new
		@floor_id = @poll.floor.id
	end

	def update
		@poll = Poll.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @poll.floor.tower.id != session[:tower_id]
			redirect_to polls_path
			return
		end
		############################################################
		############################################################
		if @poll.update_attributes(poll_params)
			redirect_to polls_path(floor_id: @poll.floor.id)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@poll = Poll.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @poll.floor.tower.id != session[:tower_id]
			redirect_to polls_path
			return
		end
		############################################################
		############################################################
		@floor_id = @poll.floor.id
	end

	def destroy
		@poll = Poll.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @poll.floor.tower.id != session[:tower_id]
			redirect_to polls_path
			return
		end
		############################################################
		############################################################
		@poll.destroy
		flash[:success] = "Poll '#{@poll.title}' deleted successfully."
		redirect_to polls_path(floor_id: @poll.floor.id)
	end

	private

	def poll_params
		params.require(:poll).permit(:title, :message)
	end

end
