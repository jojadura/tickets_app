Rails.application.routes.draw do


  get 'test/index'

  resources :categories
  resources :sub_categories

  devise_for :users

  root 'categories#index'

  
end
