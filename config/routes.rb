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


  #Configuration for user and admin course pages
  get '/courses/new', to: "courses#new", as: :new_course
  post '/courses/new', to: "courses#create", as: :create_course
  delete '/courses/:id', to: "courses#destroy", as: :destroy_course
  get '/courses', to: "courses#index", as: :view_courses
  post '/courses', to: "courses#add_course_user"
  get '/courses/:id', to: "courses#show_course_details", as: :view_course_details
  delete '/courses/:id/:user_id', to: "courses#remove_course_users", as: :remove_course_users


  #Configuration for received user feedback page
  get '/feedback/new', to: "feedback#new", as: :new_feedback
  post '/feedback/new', to: "feedback#create", as: :create_feedback
  get '/feedback', to: 'feedback#index'
  get '/feedback/completed/:id', to: 'feedback#completed', as: :feedback_completed
  get '/feedback/form', to: 'feedback#form', as: :form
  patch '/feedback/form', to: 'feedback#update'
  #post '/feedback/create', to: 'feedback#create'


  #Configuration for Teams tab
  get '/teams', to: 'teams#index'
  delete '/teams', to: 'teams#delete'
  get '/teams/create', to: 'teams#team'
  post '/teams/create', to: 'teams#create'

  #resources :users
  #resources :feedbacks
  #resources :teams
  #resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'application#hello'
  # get '/login', to: 'sessions#new'
end
