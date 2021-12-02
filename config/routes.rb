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


  get '/dashboard', to: "users#show", as: :view_user
  get '/courses', to: "courses#index", as: :view_courses
  post '/courses', to: "courses#addCourseUser"
  delete '/courses', to: "courses#removeCourseUser"


  #Configuration for received user feedback page
  get 'feedbacks/received', to: 'feedbacks#received', as: :feedback_received
  get 'feedbacks/view_completed/:id', to: 'feedbacks#view_completed', as: :feedback_view_completed

  resources :users
  resources :feedbacks
  resources :teams
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'application#hello'
  # get '/login', to: 'sessions#new'
end
