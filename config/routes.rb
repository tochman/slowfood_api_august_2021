Rails.application.routes.draw do
  # namespace :api do
  #   get 'carts/show'
  #   post 'carts/create'
  # end
  mount_devise_token_auth_for 'User', at: 'api/auth'
  namespace :api do
    resources :products, only: %i[index]
   resources :carts, only: %i[create show]
  end
end
