Soundbeats::Application.routes.draw do
  devise_for :users

  resources :students
  resources :result


  root :to => 'home#index'
end
