Rails.application.routes.draw do
  resources :users, only: [:show] do 
    resources :posts, only: [:index, :show, :new, :edit, :destroy]
  end

  resources :categories, only: [:index, :show] do
    resources :posts, only: [:index]
  end

  resources :posts

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'welcome#dashboard'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
