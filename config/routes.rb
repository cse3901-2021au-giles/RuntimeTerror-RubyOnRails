Rails.application.routes.draw do
  resources :feedbacks
  resources :users
  resources :teams
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
