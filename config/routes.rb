Rails.application.routes.draw do
  resources :group_messages
  resources :messages
  resources :groups
  resources :contacts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
