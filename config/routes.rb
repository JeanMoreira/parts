Rails.application.routes.draw do
  

  namespace :site do
    get 'home', to: 'home#index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'
  # vai analisar um caminho chamado backoffice que logo depois vai ter o dashbard
  # que vai redirecionar para o metodo da controller dashboard index.
  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
    resources :admins, except: [:show]
    get 'admins/index'
    resources :send_mail, except: [:show]
  end
  resources :parts
  resources :categories, except:[:show]
  resources :cars
  resources :companies
  resources :phones
  resources :addresses

  devise_for :admins, :skip => [:registrations]
  devise_for :members

  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
