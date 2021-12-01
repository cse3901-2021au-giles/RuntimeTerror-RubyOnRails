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

  get '/users/:id/courses', to: "users#editcourses", as: :edit_courses


  resources :users
  resources :feedbacks
  resources :teams
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'application#hello'
  # get '/login', to: 'sessions#new'
end
