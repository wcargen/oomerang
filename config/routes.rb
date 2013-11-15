Oomerang::Application.routes.draw do

  devise_for :users

  resources :user, :sessions, :item, :location

  root to: "users#index"

end
