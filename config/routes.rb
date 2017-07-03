Rails.application.routes.draw do
  namespace :site do
    get 'home/index'
  end

  namespace :backoffice do
    get 'dashboard/index'
  end

  resources :parts
  resources :categories
  resources :cars
  resources :companies
  resources :phones
  resources :addresses
  devise_for :admins
  devise_for :members
  
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
