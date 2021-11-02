Rails.application.routes.draw do
# devise_for :users
namespace :api, defaults: { format: :json } do
  namespace :v1 do
      root to: 'users#home'
      resources :users, only: [ :index, :show, :update, :create, :destroy]
    end
  end
end
