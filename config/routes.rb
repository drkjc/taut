Rails.application.routes.draw do
  resources :group_messages

  resources :messages

  resources :groups, except: [:index]

  resources :contacts, except: [:index]


  resources :users, except: [:index, :new, :show]
  get '/home', to: 'users#show', as: 'inbox'
  get '/', to: 'users#index', as: 'login'
  get '/signup', to: 'users#new', as: 'signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
