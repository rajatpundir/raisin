Rails.application.routes.draw do

	root 'access#menu'
	get 'access/menu'
	get 'access/login'
	post 'access/attempt_login'
	get 'access/logout'
	get 'home/home_notification'
	get 'home/home_tag'
	post 'polls/add_option'
	get 'polls/delete_option'
	post '/polls/vote'
	post 'topics/add_post'
	post 'moderator_topics/add_moderator_post'
	post 'global_topics/add_global_post'
	post 'objective_questions/add_wrong_answer'
	get 'objective_questions/delete_wrong_answer'

	resources :towers do
		member do
			get :delete
		end
	end

	resources :moderators do
		member do
			get :delete
		end
	end

	resources :floors do
		member do
			get :delete
		end
	end

	resources :regulars do
		member do
			get :delete
		end
	end

	resources :notifications do
		member do
			get :delete
		end
	end

	resources :tags do
		member do
			get :delete
		end
	end

	resources :polls do
		member do
			get :delete
		end
	end

	resources :topics do
		member do
			get :delete
		end
	end

	resources :moderator_topics do
		member do
			get :delete
		end
	end

	resources :global_topics do
		member do
			get :delete
		end
	end

	resources :objective_tests do
		member do
			get :delete
		end
	end

	resources :objective_questions do
		member do
			get :delete
		end
	end

	resources :exams do
		member do
			get :delete
		end
	end

end
