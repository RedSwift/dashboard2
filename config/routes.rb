Rails.application.routes.draw do

  root to:'sessions#new'
  get 'home', to: "questions#home"

  resources :users, only: [:new, :create] do
    resources :questions do
      resources :comments, except: [:index, :show]
    end
  end
  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
