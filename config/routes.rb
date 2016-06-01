Rails.application.routes.draw do


  resources :categories
  resources :subcategories

  devise_for :users

  root 'categories#index'

  
end
