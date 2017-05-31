Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  root :to => "home#index"
  resources :catergories
  resources :posts

  ActiveAdmin.routes(self)
end
