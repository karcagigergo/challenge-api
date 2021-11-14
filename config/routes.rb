Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      root to: 'users#home'
      resources :users, only: [ :index, :show, :update, :create, :destroy]
    end
  end
end
