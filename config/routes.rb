Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'
  devise_for :users
  resources :books, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
