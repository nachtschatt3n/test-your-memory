Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config

end
