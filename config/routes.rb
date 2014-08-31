Rails.application.routes.draw do

  devise_for :users

  root to: 'home#index'
  resources :babies do 
  	resources :days, shallow: true do
  		resources :nap, except: [:show, :new, :edit], shallow: true
  	end
  end


end
