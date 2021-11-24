Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  resources :feedbacks
  resources :teams
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get '/login', to: 'sessions#new'
end
