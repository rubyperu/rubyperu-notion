Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "workspaces#index"
  resources :workspaces do
    resources :documents, only: [:show, :new, :create, :edit, :update, :destroy]
    post :share
  end
end
