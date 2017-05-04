class ExamsController < ApplicationController

	before_action :confirm_logged_in

	def index
		@objective_tests = ObjectiveTest.where(:visible => true);
	end

	def show
		if params[:objective_question_id]
			@objective_question = ObjectiveQuestion.find(params[:objective_question_id])
			@objective_test = @objective_question.objective_test
		else
			@objective_test = ObjectiveTest.find(params[:id])
		end
		if !@objective_test.visible or (Time.now.utc < @objective_test.start_time) or (Time.now.utc > @objective_test.end_time)
			redirect_to exams_path
			return
		end
		@regular = Regular.find_by_username(session[:username])
		@exam_record = ExamRecord.where(:objective_test_id => @objective_test).where(:regular_id => @regular).first
		if @exam_record
			if (Time.now.utc - @exam_record.test_started_at) > @objective_test.test_duration
				redirect_to exams_path
				return
			end
			if params[:objective_question_id]
				if params[:answer] == @objective_question.answer
					@exam_record.score += 1
					@exam_record.save
				end
			end
		else
			@exam_record = ExamRecord.new(:objective_test_id => @objective_test.id, :test_started_at => Time.now.utc, :regular_id => @regular.id)
			if !@exam_record.save
				redirect_to exams_path
				return	
			end
		end
		@all_questions = @objective_test.objective_questions.ids.map(&:to_s)
		@attempted_questions = @exam_record.attempted_questions.split
		@unattempted_questions = @all_questions - @attempted_questions
		if @unattempted_questions.empty?
			redirect_to exams_path
				return
		end
		@random_question = ObjectiveQuestion.find(@unattempted_questions[rand(0...(@unattempted_questions.count))])
		@random_wrong_answer =  @random_question.wrong_answers.shuffle
		@exam_record.attempted_questions = @exam_record.attempted_questions + @random_question.id.to_s + " "
		@exam_record.save
	end

end
			