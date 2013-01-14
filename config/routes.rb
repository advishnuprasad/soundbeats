Soundbeats::Application.routes.draw do

  devise_for :users

  resources :students
  resources :results do 
    collection do 
      post 'search'
    end
  end
  root :to => 'home#index'
end
