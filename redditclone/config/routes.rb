Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :subs, only: [:edit, :update, :create, :new]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :subs, only: [:show, :index] do 
    resources :posts, only: [:new, :create, :edit, :update]
  end
  
end
