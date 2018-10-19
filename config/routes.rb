Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :therapists, only: [:show,:create,:update]
	resources :patients, only: [:index,:show,:create,:destroy,:update]
	resources :programs, only: [:show,:create,:destroy,:update]
	resources :exercises
	resources :comments, except: [:index]

	# resources :sessions, only: [:show,:create,:destroy]

	#routes for therapists
	get '/therapists/:id/patients', to: 'therapists#get_patients'
	get '/therapists/:id/exercises', to: 'therapists#get_exercises'
	
	#routes for patients
	get '/patients/:id/exercises', to: 'patients#get_exercises'
	post '/exercises/:id/flag', to: 'exercises#toggle_flag'

	post '/sessions/create', to: 'sessions#create'
	post '/get_comments', to: 'comments#get_comments'

	#session routes 
	post '/login', to: "sessions#login"
	get '/persist', to: 'sessions#persist'

end
