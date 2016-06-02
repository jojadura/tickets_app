Rails.application.routes.draw do


  resources :categories
  resources :sub_categories

  devise_for :users

  root 'categories#index'

  
end
