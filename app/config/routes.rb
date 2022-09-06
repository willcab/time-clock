Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # /store/1/employees
  #root "/stores"
  resources :stores do
    resources :employees
  end
  
end
