Soundbeats::Application.routes.draw do
  # devise_for :users

  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :students
  resources :result


  root :to => 'home#index'
end
