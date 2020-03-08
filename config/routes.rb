Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)

  root 'welcome#index'
  get 'game', to: 'game#index'
  put 'image_shown/:id', to: 'game#image_shown', as: :image_shown
  put 'answer_question/:id', to: 'game#answer_question', as: :answer_question
  
  devise_for :admin_users, ActiveAdmin::Devise.config

end
