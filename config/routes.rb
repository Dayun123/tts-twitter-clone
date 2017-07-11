Rails.application.routes.draw do

  get 'profiles' => 'profiles#index'

  get 'profiles/:id' => 'profiles#show', as: :profile

  resources :tweets
  resources :relationships

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tweets#index'

end
