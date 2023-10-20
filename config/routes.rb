Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root 'homes#top'
  get '/home/about' => 'homes#about', as: "about"

  resources :books
  resources :users

  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
