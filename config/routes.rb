Rails.application.routes.draw do
  root to: "main#index"
  get '/about', to: 'about#index'
  get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/password', to: "passwords#edit", as: :edit_password
  patch '/password', to: "passwords#update"


  #get '/dashboard', to: "users#show", as: :view_user
  get '/courses', to: "courses#index", as: :view_courses
  post '/courses', to: "courses#addCourseUser"
  delete '/courses', to: "courses#removeCourseUser"
  #post '/courses/admin', to: "courses#create"
  #delete '/courses/admin', to: "courses#delete"
  #get '/courses/remove', to: "courses#teams"
  #post '/courses/remove', to: "courses#remove"


  #Configuration for received user feedback page
  get '/feedback', to: 'feedback#index'
  get '/feedback/completed/:id', to: 'feedback#completed', as: :feedback_completed
  get '/feedback/form', to: 'feedback#form', as: :form
  patch '/feedback/form', to: 'feedback#update'
  #post '/feedback/create', to: 'feedback#create'


  #Configuration for Teams tab
  get '/teams', to: 'teams#index'
  get '/teams/create', to: 'teams#team'
  #post '/teams/create', to: 'teams#create'


  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'application#hello'
  # get '/login', to: 'sessions#new'
end
