Rails.application.routes.draw do


  get 'homes/top' => 'homes#top'
  devise_for :users
  resources :books
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
