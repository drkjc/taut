Rails.application.routes.draw do
  resources :group_messages

  resources :messages

  resources :groups, except: [:index]

  resources :contacts, except: [:index]

  get '/signup', to: 'users#new'
  resources :users


  root to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
