Oomerang::Application.routes.draw do

  resources :user, :sessions, :item, :location

  root to: "users#index"

end
