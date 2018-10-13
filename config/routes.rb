Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :therapists, only: [:show,:create,:update]
	resources :patients, only: [:index,:show,:create,:destroy,:update]
	resources :programs, only: [:show,:create,:destroy,:update]
	resources :exercises, except: [:index]
	resources :comments, except: [:index]

end
