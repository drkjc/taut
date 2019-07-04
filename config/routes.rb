Rails.application.routes.draw do

  # sessions routes
  root to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # users routes
  get '/signup', to: 'users#new'
  resources :users, only: [:index, :new, :create, :show, :update] do
    resources :groups, only: [:create, :new]
  end

  # contacts routes
  resources :contacts, only: [:index, :new, :create, :show] do
    resources :messages
  end

  #messages routes
  resources :messages

  #groups routes
  resources :groups do
    resources :group_messages
  end

  #group messages routes
  resources :group_messages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
