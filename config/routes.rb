Rails.application.routes.draw do

	root 'access#menu'
	get 'management', :to => 'access#menu'
	get 'access/menu'
	get 'access/login'
	post 'access/attempt_login'
	get 'access/logout'
	get 'home/home_notification'
	get 'home/home_tag'
	post 'topics/add_post'
	post 'polls/add_option'
	get 'polls/delete_option'

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

	resources :managements do
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

	resources :topics do
		member do
			get :delete
		end
	end

	resources :polls do
		member do
			get :delete
		end
	end

end
