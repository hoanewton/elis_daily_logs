Rails.application.routes.draw do

  devise_for :users
  get '/days/:id/summary', to: 'days#summary', as: 'summary'
  get '/days/:id/email', to: 'days#email', as: 'email'
  get '/babies/:id/search', to: 'days#search', as: 'search'

  root to: 'home#index'
  resources :babies do 
  	resources :days, shallow: true do
  		resources :events, only:[:create, :edit, :update, :destroy], :shallow => true 
  	end
  end
end
