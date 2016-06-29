Rails.application.routes.draw do
  root 'sessions#new'
  # post 'sign_up', to: 'users#create'

  resources :users, only: [:create, :new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
