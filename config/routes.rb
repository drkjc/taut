Rails.application.routes.draw do
  resources :group_messages
  get '/home', to: 'group_messages#index', as: 'inbox'

  resources :messages
  resources :groups
  resources :contacts


  resources :users, except: [:index, :new]
  get '/', to: 'users#index', as: 'login'
  get '/signup', to: 'users#new', as: 'signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
