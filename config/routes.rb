Rails.application.routes.draw do
  get 'questions/index'

  get 'questions/show'

  get 'questions/new'

  get 'questions/edit'

  root 'sessions#new'
  # post 'sign_up', to: 'users#create'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
