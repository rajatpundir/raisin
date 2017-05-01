class PollsController < ApplicationController

	before_action :confirm_logged_in

	#READ ACTIONS
	def index
		@floor = Floor.find(session[:floor_id])
		@floor_id = session[:floor_id]
		@polls = @floor.polls
	end

	def show
		@poll = Poll.find(params[:id])
	end

	# CREATE ACTIONS
	def new
		@poll = Poll.new
		@floor_id = session[:floor_id]
	end

	def create
		@poll = Poll.new(:title => params[:poll][:title], :message => params[:poll][:message], :floor_id => session[:floor_id])
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
		@floor_id = session[:floor_id]
	end

	def update
		@poll = Poll.find(params[:id])
		if @poll.update_attributes(poll_params)
			redirect_to polls_path(floor_id: session[:floor_id])
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@poll = Poll.find(params[:id])
		@floor_id = session[:floor_id]
	end

	def destroy
		@poll = Poll.find(params[:id])
		@poll.destroy
		flash[:success] = "Poll '#{@Poll.title}' deleted successfully."
		redirect_to polls_path(floor_id: session[:floor_id])
	end

	private

	def poll_params
		params.require(:poll).permit(:title, :message)
	end

end
