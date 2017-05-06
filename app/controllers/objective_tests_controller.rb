class ObjectiveTestsController < ApplicationController

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
		@floor_id = @floor.id
		@objective_tests = @floor.objective_tests.order('objective_tests.created_at DESC')
	end

	def show
		@objective_test = ObjectiveTest.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @objective_test.floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@exam_records = @objective_test.exam_records
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
		@objective_test = ObjectiveTest.new
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
		@objective_test = ObjectiveTest.new(:title => params[:objective_test][:title], :start_time => Time.now.utc + params[:objective_test][:start_time].to_i, :end_time => Time.now.utc + params[:objective_test][:end_time].to_i, :test_duration => params[:objective_test][:test_duration], :floor_id => @floor.id, :origin => session[:username])
		if @objective_test.save
			flash[:success] = "Test created successfully"
			redirect_to objective_tests_path(floor_id: params[:floor_id])
		else
			flash[:danger].now = "Test couldn't be created."
			render 'new'
		end
	end

	# UPDATE ACTIONS
	def edit
		@floor = Floor.find(params[:floor_id])
		@objective_test = ObjectiveTest.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @floor.tower.id != session[:tower_id] or @objective_test.floor.id != @floor.id
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@floor_id = @floor.id
	end

	def update
		@objective_test = ObjectiveTest.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @objective_test.floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		if @objective_test.update_attributes(objective_test_params)
			redirect_to objective_tests_path(floor_id: @objective_test.floor.id)
		else
			render 'edit'
		end
	end

	# DELETE ACTIONS
	def delete
		@objective_test = ObjectiveTest.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @objective_test.floor.tower.id != session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@floor_id = @floor.id
	end

	def destroy
		@objective_test = ObjectiveTest.find(params[:id])
		############################################################
		############SECURITY#########CHECK##########################
		if @objective_test.floor.tower.id !=  session[:tower_id]
			redirect_to floors_path
			return
		end
		############################################################
		############################################################
		@objective_test.destroy
		flash[:success] = "Test '#{@objective_test.title}' deleted successfully."
		redirect_to objective_tests_path(floor_id: @objective_test.floor.id)
	end

	private

	def objective_test_params
		params.require(:objective_test).permit(:title, :start_time, :end_time, :test_duration, :visible)
	end

end
