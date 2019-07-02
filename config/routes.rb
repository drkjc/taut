Rails.application.routes.draw do

  # sessions routes
  root to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # users routes
  get '/signup', to: 'users#new'
  resources :users, only: [:index, :new, :create, :show] do
    resources :groups
  end
  resources :users, only: [:index, :new, :create, :show] do
    resources :contacts
  end


  # contacts routes
  resources :contacts, only: [:index, :new, :create, :show] do
    resources :messages
  end





  resources :group_messages

  resources :messages

  resources :groups, except: [:index]

  resources :contacts, except: [:index]




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
