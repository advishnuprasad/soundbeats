Soundbeats::Application.routes.draw do
  devise_for :users

  resources :albums

  
  root :to => 'home#index'
end
