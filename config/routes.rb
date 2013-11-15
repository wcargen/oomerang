Oomerang::Application.routes.draw do

  devise_for :users

  resources :user, :item, :location

  root to: "users#index"

end
