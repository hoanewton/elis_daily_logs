Rails.application.routes.draw do
  devise_for :models
  devise_for :users

  root to: 'home#index'
  
end
