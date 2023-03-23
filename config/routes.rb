Rails.application.routes.draw do
  devise_for :users
  root "home#top"
  get '/home/top' => "home#top"
  resources :games, only: [:index, :new, :edit, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end
