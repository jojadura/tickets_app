Rails.application.routes.draw do


  resources :comments
  get 'assistance/index'

  get 'assistance/close'
  match 'assistance/show/:id', to: 'assistance#show', as: 'assistance', via:[:get, :post]
#  post 'assistance/show/:id', to: 'assistance#show', as: 'assistance_post'
  post 'assistance/:id/close', to: 'assistance#pre_close', as: 'pre_close_support_assistance'

  resources :states
  resources :priorities
  resources :roles
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :supports do
    member do
      post 'close'
      post 'show'
      get 'show'
    end
  end
  resources :categories
  resources :sub_categories
  devise_for :users
  resources :users
 # get 'supports/:category/subcategories' => 'supports#subcategories', as: 'subcategories'
  
end

