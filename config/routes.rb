Rails.application.routes.draw do

  get 'infraestructures',to: 'infraestructures#index'

  get 'infraestructures/close'
  match 'infraestructures/show/:id', to: 'infraestructures#show', as: 'infraestructure', via:[:get, :post]
#  post 'infraestructures/show/:id', to: 'infraestructures#show', as: 'assistance_post'
  post 'infraestructures/:id/close', to: 'infraestructures#pre_close', as: 'pre_close_support_infraestructure'

  resources :comments
  get 'assistance/index'

  get 'assistance/close'
  match 'assistance/show/:id', to: 'assistance#show', as: 'assistance', via:[:get, :post]
#  post 'assistance/show/:id', to: 'assistance#show', as: 'assistance_post'
  post 'assistance/:id/close', to: 'assistance#pre_close', as: 'pre_close_support_assistance'

  resources :priorities
  resources :roles
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :supports do
    member do
      get 'close'
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

