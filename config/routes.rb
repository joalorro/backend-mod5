Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :therapists, only: [:show,:create,:update]
	resources :patients, only: [:index,:show,:create,:destroy,:update]
	resources :programs, only: [:show,:create,:destroy,:update]
	resources :exercises
	resources :comments, except: [:index]

	# resources :sessions, only: [:show,:create,:destroy]

	post '/sessions/create', to: 'sessions#create'
	get '/therapists/:id/patients', to: 'therapists#show_patients'
	post '/get_comments', to: 'comments#get_comments'

end
