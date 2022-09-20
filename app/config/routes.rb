Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # /store/1/employees
  root '/', action: :show, controller: 'checker'
  post '/', action: :register, controller: 'checker'

  namespace :admins, as:'' do
    resources :admin, path:'', only:[:new, :create]
    get '/logout', action: :logout ,as:'', controller:'admin'
    resources :report,path:'report', only:[:index]
  end

  resources :stores do
    resources :employees
  end

end
