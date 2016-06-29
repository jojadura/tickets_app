Rails.application.routes.draw do


  get 'assistance/index'

  get 'assistance/close'
  get 'assistance/show/:id', to: 'assistance#show', as: 'assistance'
  post 'assistance/:id/close', to: 'assistance#pre_close', as: 'pre_close_support_assistance'

  resources :states
  resources :priorities
  resources :roles
  root 'categories#index'
  resources :supports do
    member do
      post 'close'
    end
  end
  resources :categories
  resources :sub_categories
  devise_for :users
  resources :users
 # get 'supports/:category/subcategories' => 'supports#subcategories', as: 'subcategories'
  
end

