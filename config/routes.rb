Rails.application.routes.draw do

	root 'access#menu'
	get 'management', :to => 'access#menu'
	get 'access/menu'
	get 'access/login'
	post 'access/attempt_login'
	get 'access/logout'

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

	resources :hidden_floors do
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

	resources :home do
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

end
