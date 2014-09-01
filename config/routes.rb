Rails.application.routes.draw do

  devise_for :users

  root to: 'home#index'
  resources :babies do 
  	resources :days, shallow: true do
  		resources :events, only:[:create, :edit, :update, :destroy], :shallow => true 
  	end
  end
end
