Rails.application.routes.draw do
  resources :group_messages

  resources :messages

  resources :groups
  get '/home', to: 'groups#index', as: 'inbox'
  
  resources :contacts


  resources :users, except: [:index, :new]
  get '/', to: 'users#index', as: 'login'
  get '/signup', to: 'users#new', as: 'signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
