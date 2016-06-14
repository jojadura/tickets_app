Rails.application.routes.draw do


  resources :roles
  root 'categories#index'
  resources :supports
  resources :categories
  resources :sub_categories
  devise_for :users
  resources :users
  get 'supports/:category/subcategories' => 'supports#subcategories', as: 'subcategories'
  
end

