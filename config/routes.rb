Oomerang::Application.routes.draw do

  devise_for :users

  resources :users, :items, :locations

  root to: "users#index"

end
