Rails.application.routes.draw do
  get 'pages/about'

  get 'pages/contact'

  get 'pages/resources'

  devise_for :admin_users, ActiveAdmin::Devise.config
  root :to => "home#index"
  resources :catergories
  resources :posts
  match '/about', :to => 'pages#about', via: [:get, :post]
  match '/contact', :to => 'pages#contact', via: [:get, :post]
  match '/resources', :to => 'pages#resources', via: [:get, :post]


  ActiveAdmin.routes(self)
end
