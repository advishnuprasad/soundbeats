Soundbeats::Application.routes.draw do
  devise_for :users

  resource :albums

  
  root :to => 'home#index'
end
