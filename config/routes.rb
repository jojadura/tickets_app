Rails.application.routes.draw do


  root 'categories#index'
  resources :supports
  resources :categories
  resources :sub_categories
  devise_for :users

  #get 'supports/:category/subcategories', as: 'subcategories'
  get 'supports/:category/subcategories' => 'supports#subcategories", as: subcategories'
  
end

