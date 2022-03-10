Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :places
  resources :posts
  if @current_user
    root to: "places#index"
  else 
    root to: "users#new"
  end
end
