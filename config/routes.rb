Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :therapists, only: [:show,:create,:update]
	resources :patients, only: [:index,:show,:create,:destroy,:update]
	resources :programs, only: [:show,:create,:destroy,:update]
	resources :exercises
	resources :comments, except: [:index]

	# resources :sessions, only: [:show,:create,:destroy]
	get '/therapists/:id/patients', to: 'therapists#get_patients'

	post '/sessions/create', to: 'sessions#create'
	post '/get_comments', to: 'comments#get_comments'
	post '/exercises/:id/flag', to: 'exercises#toggle_flag'

end
