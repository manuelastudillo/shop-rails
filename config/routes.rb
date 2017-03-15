Rails.application.routes.draw do


  resources :sales
  get 'dashboard/index'
  root to: 'dashboard#index'

   resources :sales do
    resources :sale_details
  end

  resources :clientes
  resources :items
  resources :proveedors
  resources :units
  resources :categories
  resources :brands
  #get 'validate_suggested_brand/index'
  get '/brands_suggestion', to: 'brands_suggestion#index'
  get '/validate_suggested_brand', to: 'validate_suggested_brand#index'


  #get 'validate_suggested_item/index'
  get '/items_suggestion', to: 'items_suggestion#index'
  get '/validate_suggested_item', to: 'validate_suggested_item#index'
 
  resources :reset_passwords, only: [:new, :create, :update, :edit]

  resources :sessions, only: [:new, :create, :destroy]

resources :users, only: [:new, :create]
get '/sign_up', to: 'users#new', as: :sign_up






resources :sessions, only: [:new, :create, :destroy]
get 'sessions/new'
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
get '/log_in', to: 'sessions#new', as: :log_in
delete '/log_out', to: 'sessions#destroy', as: :log_out
delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
